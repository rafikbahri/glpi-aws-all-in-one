GLPI
====

A role to install and configure a GLPI server.

Requirements
------------

None, this role is standalone.

Role Variables
--------------

Default variables are

```yaml
---
glpi_version: "10.0.18"
```

Dependencies
------------

None for now. Might depend on `common` role, that'd update system packages etc.

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - { role: rafikbahri.glpi }
```

License
-------

BSD

Author Information
------------------

- ❝ Name: Rafik Bahri
- 📜 Job title: DevOps & Cloud Engineer
- 📧 Email: rafikbahri.insat@gmail.com
- 🌍 Website: https://rafikbahri.github.io
- 🏙️ LinkedIn: https://www.linkedin.com/rafik-bahri
