#!/bin/bash

echo "Changing Directory to Terraform/EC2 Directory"
cd /home/chetan/TERRAFORM/EC2
sleep 2
echo "Files Updated! Ready to Initialize Terraform"
terraform init
echo "See the Changes"
terraform plan
sleep 2
terraform apply
echo "Configuration File will be open Shortly"
sleep 2
cat terraform.tfstate
sleep 5

echo "IP-Address Stored in Variable in Back-End"
ubuntu_instance_1_ip=$(terraform output -raw instance_ip_addr)
ubuntu_instance_2_ip=$(terraform output -raw instance_ip_addr_1)
aws_linux_instance_ip=$(terraform output -raw instance_ip_addr_2)
echo "Performing Ansible Tasks now press 1 to continuee..."
read resp
if [ $resp == 1 ];
then
	echo "Creating Directory for Ansible"
	mkdir ansible
	cd ansible
	echo "Change Dir to Ansible now creating inventory file"
	cat > inventory << EOF
[ubuntu]
ubuntu_instance_1 ansible_host=$ubuntu_instance_1_ip
ubuntu_instance_2 ansible_host=$ubuntu_instance_2_ip

[aws_linux]
aws_linux_instance ansible_host=$aws_linux_instance_ip
EOF
	echo "Working on Playbook"
	sleep 2
	cat > playbook.yml << EOF
---
- hosts: all
  become: true
  tasks:
  - name: Install nginx
    apt:
      name: nginx
      update_cache: yes
  - name: Change default html file
    copy:
      src: index.html
      dest: /etc/nginx/html/index.html
EOF
	echo "Creating Index.html file"
	cat > index.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Welcome to nginx!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>
    <p>This is the default HTML file served by nginx.</p>
  </body>
</html>
EOF
	echo "Final Step"
	echo "Running Playbook with the inventory"
	ansible-playbook playbook.yml -i inventory
fi
if [ $resp == 1 ];
then
	echo "Task Completed!"
fi

echo "Destroying all the Changes now , I hope you don't mind"
read resp1
if [ $resp1 == 1 ];
then
	cd ..
	terraform destroy
fi
