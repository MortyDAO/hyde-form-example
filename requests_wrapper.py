import requests

def get(url, headers={}, params={}):
  return requests.get(url, headers=headers, params=params)

def post(url, data, headers={}):
  return requests.post(url, data, headers=headers)
