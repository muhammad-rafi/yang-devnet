#!/usr/bin/env python

from rich import print
import xmltodict
import json
import sys

# pass the xml file location with the script 
# e.g "./xml_to_json.py ./student-data/student-data.xml"
with open(sys.argv[1], "r") as f:
   obj = xmltodict.parse(f.read())

# print(obj)
print(json.dumps(obj, indent=2))
