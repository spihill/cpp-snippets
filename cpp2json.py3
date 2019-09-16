# -*- coding: utf-8 -*-
import json
import collections as cl
import glob

target_name = "cpp.json"


def source_load(name):
	try:
		src = open(name, 'r')
		return src
	except Exception as e:
		print(e)
		src.close()
		exit(1)
		

try:
	target = open(target_name, 'w')
	sources = glob.glob("*.cpp")
	result = {}

	for source_name in sources:
		print(source_name[:-4])
		src = source_load(source_name)
		src_dict = {}
		src_dict['prefix'] = source_name[:-4]
		body = []
		for line in src:
			if line[-1] == '\n':
				body.append(line[:-1])
			else:
				body.append(line[:])
		src_dict['body'] = body
		result[source_name[:-4]] = src_dict
		src.close()

	json.dump(result,target,indent='\t')
except Exception as e:
	print(e)
	exit(1)
finally:
	target.close()
