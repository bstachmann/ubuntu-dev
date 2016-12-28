# UBUNTU-DEV - Ansible configured environment for writing and programming

This is an ansible playbook to configure my working environment.

## Create a VirtualBox Machine

 * Install *Ubuntu* (actually i use the less fancy Lubunt which better fits my old macbooks)
 * Mount a *shared folder* from the hoste to `~/work` on the guest
   - On the host check out this project to the work folder to `work/ubuntu-dev`
   - VirtualBox shared folders are a bit tricky sometimes. I did this, to make it work for me:
     - `sudo mount -t vboxsf -o umask=0022,uid=1000,gid=1000 work ~/work`
     - `sudo usermod -a -G vboxsf bjoern`
     - then logout and login again
 * Install *ansible*
   - `sudo apt-get install ansible`
 * Install *VirtualBox Guest Additions*
 * (Optional) Add a *host-only Network Interface*, if you want to access the machine via SSH from your host.

 This might be automated using Vagrant. But i haven't.

### possible improvement: install new version fo ansible

    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

## Apply UBUNTU-DEV

On the quest, navigate to the project folder:

    cd work/ubuntu-dev

Just copy the template and adjust it for your environment:

    cp sample-ubuntu-dev-vars.yml ~/.ubuntu-dev-vars.yml

Probably you should replace my SSH public key with yours. Well ... unless you want met to visit your machine.

Then start the script to load the required ansible-roles  into ansibles local repository.

    ./prepare-ansible.sh

And then ... TADAAAA ... you can run the playbook:

    ./run-ansible.sh

WARNING: This may take a while. Actually some hours, because it includes an installation of TexLive. You may want to exlude that when running this for the first time:

    ./run-ansible.sh --skip-tags heavy

You can rerun the playbook any time.

## Using Tags

    ./run-ansible.sh --list-tags --list-tasks

I have assigned some [tags](http://docs.ansible.com/ansible/playbooks_tags.html) to enable selective execution of tasks.

* `install` - everything
* `heavy` - things that may take long, e.g. installing TexLive.
* `configure` - configuring the environment

If everything is installed and you want to try some configuration changes, just run:

    ./run-ansible.sh --tags configure


## Links

  * Directory layout: http://docs.ansible.com/ansible/playbooks_best_practices.html
  * Add Code to `.bashrc`:  https://docs.ansible.com/ansible/blockinfile_module.html
  * Sudoing: http://docs.ansible.com/ansible/become.html
  * Permissons, VirtualBox, Ubuntu, Mac Os: http://askubuntu.com/questions/123025/what-is-the-correct-way-to-share-directories-in-mac-and-ubuntu-with-correct-perm

## Copyright

Copyright 2016 Bjørn Stachmann

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
