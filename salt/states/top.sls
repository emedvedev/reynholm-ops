base:
  '*':
    - sensu.client
  'role:app':
    - match: grain
    - nginx
    - app
  'role:monitoring':
    - match: grain
    - rabbitmq
    - redis.server
    - sensu.api
    - sensu.server
    - sensu.uchiwa
  'role:cnc':
    - match: grain
    - cnc
