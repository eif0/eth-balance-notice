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
	str_balance = str(balance)

	if (len(str_balance)<=18):
		for i in (range(18-len(str_balance))):
			str_balance="0"+str_balance
		print(float("0."+str_balance))
	else:
		print(float(str_balance[:(len(str_balance)-18)]+"."+str_balance[(len(str_balance)-18):]))


else:
	print('ERROR')

