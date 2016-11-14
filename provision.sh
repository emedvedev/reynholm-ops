#!/bin/sh

ROLE=$1
ID=$2

hostnamectl set-hostname "reynholm-$ROLE-$ID"

# Install saltstack
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/sources.list.d/saltstack.list
apt-get update -y
apt-get install salt-minion python-pygit2 -y

# Configure a standalone minion and a role
cp salt/config/minion.conf /etc/salt/minion.d/
cat <<EOF >> /etc/salt/minion.d/minion.conf
grains:
  role: $ROLE
EOF

systemctl stop salt-minion
systemctl disable salt-minion

# Apply state
salt-call state.apply
