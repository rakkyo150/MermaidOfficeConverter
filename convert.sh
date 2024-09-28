#!/bin/bash

input_file="$1"

filename=$(basename "$input_file" .md)

mmdc -f -i "$input_file" -o "$filename.pdf"
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windowsの場合、pdf2svgのインストールが面倒なので、wslでpdf2svgをインストールして使う
    wsl pdf2svg "$filename-1.pdf" "$filename.svg"
else
  # wslやWindows以外の場合
  pdf2svg "$filename-1.pdf" "$filename.svg"
fi
rm "$filename-1.pdf"
echo "変換が終了しました: $filename.svg"

if [ -f /proc/version ] && grep -q Microsoft /proc/version; then
    # WSLの場合
    cmd.exe /c explorer .
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    explorer .
else
# Windowsなら`explorer .`
  open .
fi

# read