rabbitmq:
  enabled: True
  running: True
  vhost:
    vh_name: 'sensu'
  user:
    sensu:
      - runas: root
      - tags: monitoring, user
      - perms:
        - 'sensu': ['.*', '.*', '.*']
      - password: secret
      - force: True
  plugin:
    rabbitmq_management:
      - enabled
