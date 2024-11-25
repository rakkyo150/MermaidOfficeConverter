#!/usr/bin/env pwsh

# スクリプトファイルの場所へカレントディレクトリを移動する
Set-Location (Split-Path $MyInvocation.MyCommand.Path -parent)

$folder_name = "mermaid_source"
$input_file = "$folder_name/$($args[0])"
$base_filename = [System.IO.Path]::GetFileNameWithoutExtension($args[0])
$filename = "$folder_name/$base_filename"

mmdc -f -i $input_file -o "$filename.pdf"
wsl -e bash -l -c "pdf2svg '$filename-1.pdf' '$filename.svg'"
Remove-Item "$filename-1.pdf"
Write-Output "Finish Converting: $filename.svg"

Start-Process "explorer.exe" -ArgumentList $folder_name