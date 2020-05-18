#/bin/bash

wget https://github.com/open-policy-agent/conftest/releases/download/v0.17.1/conftest_0.17.1_Linux_x86_64.tar.gz
tar xzf conftest_0.17.1_Linux_x86_64.tar.gz
sudo mv conftest /usr/local/bin

cd ~/training/conftest
git clone https://github.com/instrumenta/conftest.git src

