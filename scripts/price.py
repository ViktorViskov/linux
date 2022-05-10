#!/usr/bin/python3 
from requests import request
from sys import argv

if len(argv) > 1:
  url = "https://api.binance.com/api/v3/ticker/price?symbol=%s" % (argv[1].upper())
  response = request("GET", url).json()
  print(response["price"] if "price" in response else "Not found", (float(argv[2]) if len(argv) > 2 else 0) * (float(response["price"]) if "price" in response else 0))