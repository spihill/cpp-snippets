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
		

try:
	target = open(target_name, 'w')
	sources = glob.glob("*.cpp")
	result = {}

	for source_name in sources:
		src = source_load(source_name)
		src_dict = {}
		src_dict['prefix'] = source_name[:-4]
		body = []
		for line in src:
			body.append(line[:-1])
		src_dict['body'] = body
		print(source_name[:-4])
		result[source_name[:-4]] = src_dict
		src.close()

	json.dump(result,target,indent='\t')
except Exception as e:
	print(e)
finally:
	target.close()
