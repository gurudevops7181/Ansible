# Ansible user provisioning

This repository contains an Ansible playbook that creates Linux users, grants them passwordless sudo access, and installs their SSH public keys.

## Repository layout

```text
.
├── .github/workflows/ansible-syntax.yml
├── README.md
└── user-creation/
    ├── README.md
    ├── create_users.yml
    ├── inventory.ini
    └── test.pub
```

## GitHub Actions workflow

The **Ansible syntax check** workflow runs on pushes and can also be started with **Actions → Ansible syntax check → Run workflow**. It uses a Linux runner labeled `self-hosted` and checks the playbook syntax; it does not connect to inventory hosts or apply changes.

The runner needs to be a Linux self-hosted Actions runner at version 2.327.1 or later. It also needs network access to GitHub and PyPI so the workflow can check out the repository, set up Python, and install Ansible Core.

## Prepare and run the playbook

Before running it, update `user-creation/inventory.ini` with a real target host, SSH user, and private-key path. Make sure that account can use `sudo` on the target. Replace the placeholder `users` entry and put a valid public key in the configured key file; `user-creation/test.pub` is empty in this repository.

Then run from the repository root:

```sh
ansible-playbook \
  --inventory user-creation/inventory.ini \
  user-creation/create_users.yml
```

The playbook grants each configured user passwordless sudo access to all commands. Use it only for accounts that should have that level of access. Do not commit private SSH keys. Keep SSH host-key checking enabled and configure trusted host keys before connecting to production systems.

See [user-creation/README.md](user-creation/README.md) for playbook-specific details.
