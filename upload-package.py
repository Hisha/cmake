#!/usr/bin/python
import sys
import requests                                 # To use request package in current program 

print('This is the internal script')

print ('Number of arguments:', len(sys.argv), 'arguments.')
print ('Argument List:', str(sys.argv))

arguments = sys.argv[1:]

APIurl =  arguments[0];
print ('url', str(APIurl))
APItoken =  arguments[1];
print ('token', str(APItoken))
projectId =  arguments[2];
print ('projId', str(projectId))
artifactName =  arguments[3];
print ('name', str(artifactName))
#Get acsess token
#Get all packages
#response = requests.get("www.dummyurl.com")     # To execute get request 