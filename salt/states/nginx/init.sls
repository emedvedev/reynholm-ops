# App node configuration: nginx + html source.

Nginx should be installed:
  pkg.installed:
    - name: nginx
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default

Nginx should be configured:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 640

Default site should be configured:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://nginx/{{ grains['role'] }}.conf
    - user: root
    - group: root
    - mode: 640

Default site should be enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/default
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default
