rabbitmq:
  enabled: True
  running: True
  plugin:
    rabbitmq_management:
      - enabled
  vhost:
    vh_name: 'sensu'
  user:
    sensu:
      - password: secret
      - force: True
      - tags: monitoring, user
      - perms:
        - '/sensu':
          - '.*'
          - '.*'
          - '.*'
      - runas: root
