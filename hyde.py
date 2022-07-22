import csv
import json
import os
from typing import Iterable

input_path = '/parcel/data/in'
output_path = '/parcel/data/out'

def expand_input_path(filename:str):
  return input_path + '/' + filename

def expand_output_path(filename:str):
  return output_path + '/' + filename

def read_json(filename:str):
  return json.loads(read(filename))

def write_json(filename:str, content_dict):
  write(filename, json.dumps(content_dict))

def write_csv(filename: str, iterable: Iterable):
  with open(output_path + '/' + filename, 'w', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerows(iterable)

def read(filename:str):
  with open(input_path + '/' + filename, 'r') as f:
    content = f.read()
  return content

def write(filename:str, content:str):
  with open(output_path + '/' + filename, 'w') as f:
    f.write(content)

def listdir_input():
  return os.listdir(input_path)

def listdir_output():
  return os.listdir(output_path)

class InvalidContentError(Exception):
  """Raised when input data is invalid"""
  pass