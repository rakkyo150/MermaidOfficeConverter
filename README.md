# 使い方
mermaid_sourceディレクトリを作成し、その中にmdファイルを作成。  
mdファイルの中でmermaidを作成。  
その後、Microsoft Officeのソフトに貼り付けるのに適切な形式であるsvgに変換するため、`convert.sh`を実行。 
```bash
mkdir mermaid_source
vim mermaid_source/input.md
sh convert.sh input.md
```

# 依存ツール
[mermaid-cli](https://github.com/mermaid-js/mermaid-cli)  
[pdf2svg](https://github.com/dawbarton/pdf2svg)