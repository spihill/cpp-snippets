#!/bin/bash

if [ -z "$MY_VSCODE_SNIPPETS_DIR" ]; then
	echo "Please set MY_VSCODE_SNIPPTES_DIR"
	exit 1
fi

python3 cpp2json.py && cp -i cpp.json $MY_VSCODE_SNIPPETS_DIR
