#!/bin/bash

input_file="$1"

filename=$(basename "$input_file" .md)

mmdc -f -i "$input_file" -o "$filename.pdf"
pdf2svg "$filename-1.pdf" "$filename.svg"
rm "$filename-1.pdf"
echo "変換が終了しました: $filename.svg"
open .
pause