##### Creating ansible playbook####
---
- name: Publish OS
  hosts: all
  tasks:
    - name: Ensure the OS is installed
      command: "echo 'Publishing OS...'"

#### Publish####

#!/bin/bash

# Define variables
TOWER_CLI_CONFIG="/path/to/tower_cli.cfg"
PROJECT_NAME="PublishOSProject"
INVENTORY_NAME="PublishOSInventory"
JOB_TEMPLATE_NAME="PublishOSJobTemplate"
PLAYBOOK_PATH="/path/to/publish_os.yml"
VAULT_PASSWORD="your_vault_password"

# Ensure tower-cli is configured
tower-cli config host http://your-ansible-tower
tower-cli config username your_username
tower-cli config password your_password
tower-cli config verify_ssl false

# Create a project
tower-cli project create \
  --name "$PROJECT_NAME" \
  --organization "Default" \
  --scm-type "manual" \
  --local-path "$PLAYBOOK_PATH"

# Create an inventory
tower-cli inventory create \
  --name "$INVENTORY_NAME" \
  --organization "Default"

# Create a job template
tower-cli job_template create \
  --name "$JOB_TEMPLATE_NAME" \
  --job-type "run" \
  --inventory "$INVENTORY_NAME" \
  --project "$PROJECT_NAME" \
  --playbook "$PLAYBOOK_PATH"

# Launch the job
tower-cli job launch \
  --job-template "$JOB_TEMPLATE_NAME" \
  --vault-password "$VAULT_PASSWORD"

echo "OS publish job launched on Ansible Tower."

