#!/usr/bin/python
###################################################################################################
# Hive UDTF to parse json data
###################################################################################################
import sys
import json
reload(sys)
sys.setdefaultencoding('utf8')

def parse_json(json_string):
	j = json.loads(json_string)
	deviceId=j["deviceId"]
	events=j["events"]
	sys.stderr.write("Parsed json successfully\n")

	x=1
	y=0
	z=x/y	
	# Flatten Events Array
        for evt in events:
		try:
                	eventType = evt.keys()[0]
                	e = evt[eventType]
               		edata = []
                        edata.append(eventType)
			sys.stderr.write("Parsing array element\n")
                        edata.append(e.get("timestamp",u''))
                        edata.append(e.get("errorReason",u''))
                        edata.append(e.get("errorMsg",u''))
		except Exception as ex:
			sys.stderr.write('AN ERROR OCCURRED IN PYTHON UDTF\n %s\n' % ex.message)

		print u'\t'.join(edata)

def main(argv):
        for line in sys.stdin:
		sys.stderr.write("\n****************\n")
		sys.stderr.write(line)
                parse_json(line)

if __name__ == "__main__":
        main(sys.argv[1:])
