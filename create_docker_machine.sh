#!/bin/bash

IP={REMOTE_SERVER_IP_ADDRESS}
USER={SSH_USER_NAME}
KEY={PATH_TO_SSH_PRIVATE_KEY}
PORT={SSH_PORT_NUMBER}
NAME={NAME_OF_APP} # anything is fine

docker-machine create \
  --driver generic \
  --generic-ip-address=$IP \
  --generic-ssh-user $USER \
  --generic-ssh-key $KEY \
  --generic-ssh-port $PORT \
  $NAME
