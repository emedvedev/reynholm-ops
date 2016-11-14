base:
  '*':
    - sensu
  'role:app':
    - match: grain
    - app
  'role:monitoring':
    - match: grain
    - redis
