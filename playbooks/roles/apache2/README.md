Apache2
=======

A role to install and configure an Apache 2 server.

Requirements
------------

None, this role is standalone.

Role Variables
--------------

Default variables are

```yaml
apache_port: 80
apache_server_admin: webmaster@localhost
apache_server_name: localhost
apache_document_root: /var/www/html
```

Dependencies
------------

None for now. Might depend on `common` role, that'd update system packages etc.

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - { role: rafikbahri.apache2 }
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
