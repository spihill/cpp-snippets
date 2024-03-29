#!/bin/bash

files='files.txt'
user='spihill'
repo='library'
branch='update-files'

rm -f ./*.cpp

	echo "Downloading $files"
	curl -sS -O https://raw.githubusercontent.com/spihill/library/$branch/.github/myscript/$files

tmp=.cpplib.tmp
tail -n +2 $files > $tmp

exec 3< $tmp

while read line 0<&3
do
	echo "Downloading $line"
# 	curl -s -S -O -H "Authorization: token $MY_GITHUB_SOURCE_TOKEN" -H 'Accept: application/vnd.github.v3.raw' -L https://api.github.com/repos/$user/$repo/contents/$line &
	curl -sS -O https://raw.githubusercontent.com/spihill/library/$branch/$line &
	sleep 0.2
done

wait

rm $tmp
