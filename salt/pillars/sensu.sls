sensu:
  rabbitmq:
    host: 'reynholm-monitoring-1'
  api:
    user: 'admin'
    password: '3TuV?!p!wM?8r4t8'
    # Normally, if you absolutely have to store your passwords
    # in pillar in plain text, you would add a GPG renderer:
    # https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html
  uchiwa:
    - name: 'Reynholm Industries'
      host: localhost
      user: 'admin'
      pass: '3TuV?!p!wM?8r4t8'
