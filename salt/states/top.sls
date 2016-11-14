base:

  '*':
    - sensu.client

  'role:app':
    - match: grain
    - nginx
    - app

  'reynholm-monitoring-1':
    - rabbitmq
    - redis.server
    - sensu.server
    - sensu.uchiwa
    - sensu.api
