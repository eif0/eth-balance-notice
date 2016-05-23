import requests
import os
req = requests.get('https://etherchain.org/api/account/0xd0db456178206f5c4430fe005063903c3d7a49a7')
content = req.json()
balance = content["data"][0]['balance']
print(balance)
