#!/bin/bash

folder_name="mermaid_source"
input_file="$folder_name/$1"
base_filename="${1%.md}"
filename="$folder_name/$base_filename"

node_modules/.bin/mmdc -f -i "$input_file" -o "$filename.pdf"
pdf2svg "$filename-1.pdf" "$filename.svg"
rm "$filename-1.pdf"
echo "変換が終了しました: $filename.svg"

open $folder_name/.