sensu:
  rabbitmq:
    host: 'alpha.monitoring.reynholm.ru'
    vhost: 'sensu'
    user: 'sensu'
    password: 'secret'
  client:
    name: "{{ grains['shortname'] }}.{{ grains['role'] }}.reynholm.ru"
    address: {{ grains['ipv4'][0] }}
    embedded_ruby: True
    nagios_plugins: True
    keepalive:
      interval: 3
      handler: st2
    subscriptions:
      - all
  api:
    user: 'admin'
    password: '3TuV?!p!wM?8r4t8'
    # Normally, if you absolutely have to store your passwords
    # in pillar in plain text, you would add a GPG renderer:
    # https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html
  uchiwa:
    host: '0.0.0.0'
    users:
      - username: 'admin'
        password: '3TuV?!p!wM?8r4t8'
        role:
          readonly: False
  sites:
    - name: 'Reynholm Industries'
      host: 'localhost'
      user: 'admin'
      pass: '3TuV?!p!wM?8r4t8'
      port: 4567
