#!/bin/bash

ROLE=$1
NAME=$2

# Install saltstack
curl -sL https://bootstrap.saltstack.com | bash -s -- -P -X -d

# Configure a standalone saltstack minion
curl -sL https://emedvedev.github.io/reynholm-ops/provision/salt-minion.conf -o /etc/salt/minion.d/minion.conf
cat <<EOF >> /etc/salt/minion.d/minion.conf

grains:
  role: $ROLE
  shortname: $NAME
EOF

# Install git-python
apt-get -y install python-git < "/dev/null"

# Apply state
salt-call state.apply
