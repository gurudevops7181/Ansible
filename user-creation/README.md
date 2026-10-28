# User creation playbook

The [`create_users.yml`](create_users.yml) playbook manages the `users` list defined in the playbook. For each entry, it creates a home directory, writes a passwordless sudoers rule, and adds the configured SSH public key.

Edit the inventory and `users` list before use. The `pubkey_file` path must point to a valid public key available to Ansible on the control node. The checked-in `test.pub` is an empty placeholder.

From the repository root, run:

```sh
ansible-playbook \
  --inventory user-creation/inventory.ini \
  user-creation/create_users.yml
```

The [repository README](../README.md) documents the self-hosted GitHub Actions syntax-check workflow and the prerequisites for using it.
