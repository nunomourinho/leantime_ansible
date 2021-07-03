#!/bin/bash
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible ansible-lint git-all virtualbox virtualbox-ext-pack python3-pip -y
sudo apt install mc screen -y
sudo apt install net-tools -y
python3 -m pip install "molecule[ansible]"
python3 -m pip install "molecule[docker,lint]"
python3 -m pip install "molecule-vagrant"
python3 -m pip install "python-vagrant"
python3 -m pip install "Jinja2"
python3 -m pip install "molecule-libvirt"
pip3 install --upgrade jinja2-cli docker-py molecule ansible ansible-lint

