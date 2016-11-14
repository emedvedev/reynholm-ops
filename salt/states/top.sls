base:

  '*':
    - sensu.client

  'role:app':
    - match: grain
    - nginx
    - app

  'reynholm-monitoring-1':
    - rabbitmq
    - redis
    - sensu.server
    - sensu.uchiwa
    - sensu.api
