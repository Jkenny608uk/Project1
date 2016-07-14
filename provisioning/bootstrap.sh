#!/bin/bash

printf '
######################################################################################
##                                                                                  ##
##                             Installing Ansible                                   ##
##                                                                                  ##
## While you wait, learn about Ansible: http://docs.ansible.com/                    ##
##                                                                                  ##
######################################################################################'

# install EPEL repo and allow deltarpms to save bandwidth
sudo yum -y install epel-release deltarpm

# install all updates except kernel updates (creates compatability problems with VBox Guest Additions)
yum -y -x 'kernel*' update

# install ansible
sudo yum -y install ansible

# setup the local machine as the ansible host
sudo echo riak-test > /etc/ansible/hosts

# install galaxy roles
sudo ansible-galaxy install basho-labs.riak-kv geerlingguy.php geerlingguy.composer joshualund.golang geerlingguy.java geerlingguy.repo-remi geerlingguy.nodejs rvm_io.rvm1-ruby --ignore-errors

printf '
######################################################################################
##                                                                                  ##
##             Executing Ansible playbook, please be patient...                     ##
##                                                                                  ##
######################################################################################'

#ansible-playbook /vagrant/provisioning/playbook.yml --connection=local

printf '
######################################################################################
##                                                                                  ##
##                          Provisioning complete!                                  ##
##                                                                                  ##
## If you see red (error) above:                                                    ##
##   - Try vagrant destroy, then vagrant up again                                   ##
##   - Copy and paste the error to https://gist.github.com/, then send me the link  ##
##                                                                                  ##
######################################################################################
'
