#!/bin/bash

if [ -z "$VSCODE_SNIPPETS_DIR" ]; then
	echo "Please set VSCODE_SNIPPTES_DIR"
	exit 1
fi

python3 cpp2json.py3 && cp -i cpp.json $VSCODE_SNIPPETS_DIR
