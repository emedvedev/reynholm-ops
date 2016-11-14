#!/bin/sh

ROLE=$1
ID=$2

hostnamectl set-hostname "reynholm-$ROLE-$ID"

# Install saltstack
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P -X -d

# apt-get install python-dev python-pip python-git -y

# Configure a standalone minion and a role
cp salt/config/minion.conf /etc/salt/minion.d/
cat <<EOF >> /etc/salt/minion.d/minion.conf
grains:
  role: $ROLE
EOF

# Apply state
salt-call state.apply
