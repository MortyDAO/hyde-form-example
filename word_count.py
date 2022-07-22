import pandas as pd
import hyde

def stringify(v):
  type = v['type']
  f = {
    'text': lambda: v['value'],
    'number': lambda: str(v['value']),
    'choices': lambda: ' '.join(v['value'])
  }[type]
  return f()

try:
  word_count = 0
  response_files = [name for name in hyde.listdir_input() if name.startswith('response-') and name.endswith('.json')]

  for path in response_files:
    json = hyde.read_json(path)
    for answer in json['answers']:
      s = stringify(answer)
      
      word_count += len(s.split(' '))

  result = { 'message': f"Responses have {word_count} words in total" }
  hyde.write_json('result.json', result)

except BaseException as e:
  hyde.write_json('error.json', {'error': repr(e)})
  