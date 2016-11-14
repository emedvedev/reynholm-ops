The minion repo should be up-to-date:
  git.latest:
    - name: https://github.com/emedvedev/reynholm-ops
    - target: /opt/reynholm-ops
    - force_checkout: True
    - force_reset: True
