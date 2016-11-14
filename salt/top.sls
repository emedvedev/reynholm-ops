base:
  '*':
    - nginx
  'roles:app':
    - match: grain
    - app
