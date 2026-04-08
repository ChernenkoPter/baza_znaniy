#!/bin/bash

output_file="${1:-full_export.md}"

[ -f "$output_file" ] && echo "Файл $output_file существует и будет перезаписан"

> "$output_file"

find . -name "*.md" ! -name "$output_file" ! -name "*MOC*" -print0 | sort -z | while IFS= read -r -d '' file; do
    filename=$(basename "$file" .md)
    echo "## $filename" >> "$output_file"
    echo "" >> "$output_file"
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"
    echo "" >> "$output_file"
done

echo "Готово! Файл сохранен как: $output_file"
