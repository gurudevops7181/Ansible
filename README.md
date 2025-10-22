🧑‍💻 Ansible Playbook — Create Users, Add to Sudoers, and Configure SSH Access

This Ansible playbook automates the process of creating system users, granting them passwordless sudo access, and configuring their SSH authorized keys for secure remote login.

⸻

📘 Overview

This playbook:
	•	Creates Linux users with home directories.
	•	Adds users to /etc/sudoers.d/ for passwordless sudo privileges.
	•	Adds SSH public keys to each user’s ~/.ssh/authorized_keys.
	•	Can easily be extended to manage permissions or update sshd_config.

⸻

📁 Project Structure
ansible/
├── inventory.ini
├── create_users.yml
├── test.pub

⚙️ Prerequisites

✅ Ansible installed on your control node
✅ SSH access to target hosts
✅ A valid private key (.pem or .key) for the remote user
✅ Python installed on the managed node (default: /usr/bin/python3)

⸻

🧩 Inventory File (inventory.ini)
[prod]
192.168.1.10

[prod:vars]
ansible_user=test
ansible_ssh_private_key_file=/Users/gurunadh/guru/ssh_key/guru
ansible_ssh_common_args='-o StrictHostKeyChecking=no -p 22'
# ansible_python_interpreter=/usr/bin/python3

📜 Playbook File (create_users.yml)

---
- name: Create users and add to sudoers with SSH keys
  hosts: prod
  gather_facts: yes
  become: true

  vars:
    users:
      - name: test
        pubkey_file: ./test.pub

  tasks:
    - name: Add users to system
      user:
        name: "{{ item.name }}"
        shell: /bin/bash
        create_home: yes
        home: /home/{{ item.name }}
      with_items: "{{ users }}"

    - name: Add sudo privileges to users
      copy:
        content: "{{ item.name }} ALL=(ALL) NOPASSWD:ALL"
        dest: /etc/sudoers.d/{{ item.name }}
        mode: 0440
      with_items: "{{ users }}"

    - name: Add SSH key to authorized_keys
      authorized_key:
        user: "{{ item.name }}"
        state: present
        key: "{{ lookup('file', item.pubkey_file) }}"
      with_items: "{{ users }}"

      🗝️ Example SSH Public Key File (test.pub)
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3gJbq... user@example


    ▶️ Run the Playbook

    To execute the playbook:
      ansible-playbook -i inventory.ini create_users.yml

      If you want to run it with more verbosity (debug mode):
      ansible-playbook -i inventory.ini create_users.yml -vvv




    🧠 Notes
	•	Each user defined in users will:
	•	Have a home directory.
	•	Get passwordless sudo access.
	•	Be able to log in via SSH using the provided public key.
	•	The playbook can handle multiple users; just add more entries under users.

⸻

🧑‍💻 Author

Gurunadh
DevOps Engineer | AWS | Automation | Docker | Terraform | Kubernetes | Ansible | GitLab
📧 gurujames7181@gmail.com
🔗 LinkedIn
💻 GitHub
