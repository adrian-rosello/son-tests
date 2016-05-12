#!/bin/bash

set -xe

#cleanup
scripts/clean-catalogue-server.sh 127.0.0.1 4012

# Prepare working environment
mkdir -p workspaces projects packages



# son-emu
scripts/print-header.sh "Testing: Workspace + Project + Dep-Project, push to SON-EMU"
scripts/1_create_son_workspace.sh workspaces/ws1
scripts/2_standalone-project-y1.sh workspaces/ws1 projects/prj1 resources/project-Y1-emu.zip
scripts/3_dependent-project-y1.sh workspaces/ws1 projects/prj2 resources/project-Y1-emu.zip

# clean catalogues
scripts/clean-catalogue-server.sh 127.0.0.1 4012


# son-sp
scripts/print-header.sh "Testing: Workspace + Project + Dep-Project, push to SON-SP"
scripts/1_create_son_workspace.sh workspaces/ws2
scripts/2_standalone-project-y1.sh workspaces/ws2 projects/prj3 resources/project-Y1-sp.zip
scripts/3_dependent-project-y1.sh workspaces/ws2 projects/prj4 resources/project-Y1-sp.zip


