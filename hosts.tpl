[allservers]
server1 ansible_host=${server1}      ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2
server2 ansible_host=${server2}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2
server3 ansible_host=${server3}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2



[webservers]
server1 ansible_host=${server1}      ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2

[appservers]
server2 ansible_host=${server2}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2

[dbservers]
server3 ansible_host=${server3}       ansible_connection=ssh ansible_user=ubuntu ansible_port=22 ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa_ec2
