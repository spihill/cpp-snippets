#!/bin/bash

files='files.txt'

 	curl -O -H "Authorization: token $MY_GITHUB_SOURCE_TOKEN" -H 'Accept: application/vnd.github.v3.raw' -L https://api.github.com/repos/spihill/library/contents/$files

exec 3< $files

while read line 0<&3
do
	echo $line
 	curl -O -H "Authorization: token $MY_GITHUB_SOURCE_TOKEN" -H 'Accept: application/vnd.github.v3.raw' -L https://api.github.com/repos/spihill/library/contents/$line

done

