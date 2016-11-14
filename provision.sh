#!/bin/sh

ROLE=$1

# Install saltstack
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get install salt-minion -y

# Configure a standalone minion and a role
cp salt/config/standalone.conf /etc/salt/minion.d/
cat <<EOF >> /etc/salt/minion.d/standalone.conf
grains:
  roles:
    - $ROLE
EOF

systemctl stop salt-minion
systemctl disable salt-minion

# Apply state
salt-call state.apply
