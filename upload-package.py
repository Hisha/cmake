#!/usr/bin/python
import sys
import requests                                 # To use request package in current program 

print('This is the internal script')

print ('Number of arguments:', len(sys.argv), 'arguments.')
print ('Argument List:', str(sys.argv))

response = requests.get("www.dummyurl.com")     # To execute get request 