#!/bin/sh

ROLE=$1

# Install saltstack
curl -sL https://bootstrap.saltstack.com | bash -s -- -P -X -d

# Install git-python
apt-get install python-git -y

# Configure a standalone saltstack minion
curl -sL https://raw.githubusercontent.com/emedvedev/reynholm-ops/master/provision/salt-minion.conf -o /etc/salt/minion.d/minion.conf
cat <<EOF >> /etc/salt/minion.d/minion.conf

grains:
  role: $ROLE
EOF

# Apply state
salt-call state.apply
