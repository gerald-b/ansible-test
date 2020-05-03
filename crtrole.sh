#!/bin/bash -x

if [ "$(id -u)" -eq "1001" ]; then
        rolename=${1}
        cd ~
        mkdir -p roles/${rolename}/{tasks,handlers,templates,files,vars,defaults,meta,library,lookup_plugins,module_utils}

        touch roles/${rolename}/{tasks,handlers,vars,defaults,meta}/main.yml
        touch roles/${rolename}/{templates,files,library,lookup_plugins,module_utils}/.gitkeep
else
        echo "Muss als ansible-user laufen" 1>&2
        exit 1
fi
