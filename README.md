win_profile_setup
=========
[![Build Status](https://travis-ci.org/pyrotimux/win_profile_setup.png?branch=master)](https://travis-ci.org/pyrotimux/win_profile_setup)
Setup folders for windows roaming profile.

Requirements
------------

WMF 5 (or powershell) on window box.

Role Variables
--------------
Please pass in the variable below. Example is shown below.
```
# users to create their folders as.
  users:
    - { name: 'ichiban', pass: 'ichiV@gran7' }
    - { name: 'niban', pass: 'niV@gran7' }
    - { name: 'sanban', pass: 'sanV@gran7'}
    - { name: 'yonban', pass: 'yonV@gran7'}

# name of the file server.
  file_server: KGSTRGUTL
```

Dependencies
------------

You need the library folder in your ansible directory. It has the dsc modules needed for the play to work.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```
- hosts: all
  gather_facts: true
  roles:
     - win_profile_setup
```

License
-------

MIT

Author Information
------------------

chaosmuskey@gmail.com
