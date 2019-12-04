#/bin/bash

wget https://github.com/instrumenta/conftest/releases/download/v0.15.0/conftest_0.15.0_Linux_x86_64.tar.gz
tar xzf conftest_0.15.0_Linux_x86_64.tar.gz
sudo mv conftest /usr/local/bin

cd ~/training/conftest
git clone https://github.com/instrumenta/conftest.git src


cd ~/training
