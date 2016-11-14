#!/bin/sh

ROLE=$1
ID=$2

# Install saltstack
add-apt-repository ppa:saltstack/salt
apt-get update
apt-get install salt-minion

# Configure a standalone minion and a role
cp salt/config/standalone.conf /etc/salt/minion.d/
cat <<EOF >> /etc/salt/minion.d/standalone.conf
grains:
  roles:
  	- $1
EOF

systemctl disable salt-minion

# Apply state
salt-call state.apply
