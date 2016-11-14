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
    - source: salt://nginx.conf
    - user: root
    - group: root
    - mode: 640
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://{{ grains['roles'][0] }}.conf
    - user: root
    - group: root
    - mode: 640
  file.symlink:
    - name: /etc/nginx/sites-enabled/default
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default
