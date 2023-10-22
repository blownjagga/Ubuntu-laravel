#!/bin/bash

# Define your SSH key file and remote server details
SSH_KEY="/C:/Users/HP/.ssh"
REMOTE_USER="Jagga"
REMOTE_HOST="127.0.0.1"
REMOTE_HOST_PASSWORD="jagga"

# Function to retry SSH connection
retry_ssh() {
  local max_attempts=3
  local attempt=0
  local ssh_command="ssh -i $SSH_KEY $REMOTE_USER@$REMOTE_HOST"

  while [ $attempt -lt $max_attempts ]; do
    echo "Attempting SSH connection (Attempt $((attempt+1)) of $max_attempts)..."
    $ssh_command

    if [ $? -eq 0 ]; then
      echo "SSH connection successful."
      break
    else
      echo "SSH connection failed. Retrying in 10 seconds..."
      sleep 10
      attempt=$((attempt+1))
    fi
  done

  if [ $attempt -eq $max_attempts ]; then
    echo "SSH connection failed after $max_attempts attempts. Please check your configuration."
  fi
}

# Main script
echo "Fixing SSH auth method and connection issues..."
retry_ssh