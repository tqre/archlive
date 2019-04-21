#!/bin/bash
echo Minion initialization script starting...

cat > /etc/salt/minion << EOF
master: $(cat /tmp/minion/master_ip)
id: $(hostname -i)

startup_states: sls

sls_list:
  - onconnect

EOF

echo Master IP is set to $(cat /tmp/minion/master_ip)
echo Minion ID is $(hostname -i)

echo Starting the salt-minion service...
systemctl start salt-minion
