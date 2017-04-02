win_profile_setup
=========
[![Build Status](https://travis-ci.org/pyrotimux/pyrotimux.ProfileSetup.png?branch=master)](https://travis-ci.org/pyrotimux/pyrotimux.ProfileSetup)
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
# If my file server is KGSTRGUTL and drive is c$ and path is profiles then
  file_server: KGSTRGUTL\\c$\\profiles

  profile_path: C:\profiles
  user_group_str: "Accounting, IT"
  user_group:
    - "Accounting"
    - "IT"


  domainnetbios: kg
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
