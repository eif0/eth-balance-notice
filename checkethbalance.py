import requests
import os
import getopt
import sys

opts, extra = getopt.getopt(sys.argv[1:], 'a:', ['account='])
if (extra != []):
	print("\n\nIt looks like you have added some non-valid params...\n\n")
	sys.exit(2)
if (opts == []):
	print("\n\nIt looks like you forgot to add some params...\n")
	sys.exit(2)

for code,param in opts:
	if code in ["-a","--account"]:
		 account = param

url='https://etherchain.org/api/account/'+account
req = requests.get(url)
content = req.json()
if content['data'] != []:
	balance = content['data'][0]['balance']
	print(balance)
else:
	print('ERROR')

