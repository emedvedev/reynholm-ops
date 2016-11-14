base:
  'roles:app':
    - match: grain
    - nginx
    - sensu.client
    - app
  'roles:monitoring'
    - match: grain
    - rabbitmq
    - redis.server
    - sensu.server
    - sensu.uchiwa
    - sensu.api
