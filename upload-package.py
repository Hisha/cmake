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
my_headers = {'PRIVATE-TOKEN' : 'nBU1UCHC8oDu3mhtDcMm'}
response = requests.get(f"{APIurl}/projects/{projectId}/packages", headers=my_headers )     # To execute get request 

print(response.json())