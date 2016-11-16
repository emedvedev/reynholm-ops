StackStorm should be installed:
  cmd.run:
    - name: "curl -sSL https://stackstorm.com/packages/install.sh | bash -s -- --user=admin --password=myst2pass --unstable --staging"
    - creates: /opt/stackstorm

Reynholm prerequisite packs should be installed:
  cmd.run:
    - name: "st2 pack install sensu aws hue"
    - runas: root

Reynholm pack should be installed:
  cmd.run:
    - name: "st2 pack install https://github.com/emedvedev/reynholm-stackstorm"
    - runas: root
