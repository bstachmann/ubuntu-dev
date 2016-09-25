## Create config file

Just copy the template and adjust it for your environment:

    cp sample-ubuntu-dev-vars.yml ~/.ubuntu-dev-vars.yml

## Notes


    git clone pi@raspberrypi:/git/ubuntu-dev.git
    cd ubuntu-dev
    sudo apt-get install ansible
    ansible-playbook ubuntu-dev.yml


    export DISPLAY=:0
