PHP
===

A role to install PHP and its recommended extensions.

Requirements
------------

None, this role is standalone.

Role Variables
--------------

Default variables are

```yaml
---
packages:
  - php
  - php-apcu
  - php-cli
  - php-common
  - php-curl
  - php-gd
  - php-imap
  - php-ldap
  - php-mysql
  - php-xmlrpc
  - php-xml
  - php-mbstring
  - php-bcmath
  - php-intl
  - php-zip
  - php-redis
  - php-bz2
  - libapache2-mod-php
  - php-soap
  - php-cas
```

Dependencies
------------

None for now. Might depend on `common` role, that'd update system packages etc.

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - { role: rafikbahri.php }
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
