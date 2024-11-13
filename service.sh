#!/bin/bash
SERVICE_NAME="onlyoffice"
SERVICE_VERSION="v0.1"

set -e

SERVICE_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo "[$SERVICE_NAME] $SERVICE_VERSION ($(git rev-parse --short HEAD))"
cd $SERVICE_DIR

# CORE
source ./core/core.sh


# VARIABLES
set -o allexport
# set variables for docker or other services here
set +o allexport

# COMMANDS

commands+=([example]=":Start onlyoffice example")
cmd_example() {
  docker compose exec onlyoffice sudo supervisorctl start ds:example
}

# ATTACHMENTS

# Setup function that is called before the docker up command
# att_setup() {
#   echo "Setting up..."
# }

# Configure function that is called before the docker up, start and restart commands
# att_configure() {
#   echo "Configuring..."
# }

# MAIN
main "$@"
