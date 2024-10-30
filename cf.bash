#!/bin/bash

directory=""
included_extensions=""
depth=""
output=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --include|-i)
      included_extensions="$2"
      shift 2
      ;;
    --depth|-d)
      depth="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [directory] [--include|-i extensions] [--depth|-d depth]"
      echo "
Options:"
      echo "  directory            The directory to scan for files."
      echo "  --include, -i        A comma-separated list of file extensions to include."
      echo "  --depth, -d          The depth of the scan. Minimum value is 1."
      echo "  --help, -h           Show this help message and exit."
      exit 0
      ;;
    *)
      directory="$1"
      shift
      ;;
  esac
done

if [ -z "$depth" ] || [ "$depth" -lt 1 ]; then
  depth=1
fi

if [ -d "$directory" ]; then
  IFS=',' read -r -a extensions_array <<< "$included_extensions"

  while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      extension="${filename##*.}"

      if [ -z "$included_extensions" ] || [[ " ${extensions_array[@]} " =~ " $extension " ]]; then
        content=$(cat "$file")
        output+="\`\`\`$filename\n$content\n\`\`\`\n\n"
      fi
    fi
  done < <(find "$directory" -maxdepth "$depth" -type f -print0)

  echo -e "$output" | pbcopy

  symbol_count=${#output}
  token_estimate=$((symbol_count / 4))

  echo -e "Copied to clipboard. $symbol_count symbols, $token_estimate estimated tokens"
else
  echo "The provided path is not a directory."
fi
