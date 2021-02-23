#!/bin/bash
VERSION=0.14.7
echo "Downloading terraform $VERSION"
wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip

sudo apt install zip -y
echo "Unziping terraform" 
sudo unzip terraform_0.14.7_linux_amd64.zip
echo "Moving terraform bin to usr bins"
sudo mv terraform /usr/local/bin
echo "Checking terraform version"
terraform version
echo "Cleaning zip files"
rm terraform_0.14.7_linux_amd64.zip
