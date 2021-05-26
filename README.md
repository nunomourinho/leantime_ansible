Role Name
=========

Este role instala a plataforma de gestão de projetos agil leantime num servidor ou máquina virtual com Ubuntu 20.04

Requirements
------------

Ubuntu 20.04, Ubuntu 21.04. 

Role Variables
--------------
    login_leantime - Utilizador a ser criado na base de dados de Mysql ou MariaDB
    password_leantime - Password da base de dados de Mysql ou MariaDB
    login_website - Endereço de email para o login inicial no site web
    password_website - Password para o site web. Tem de obrigatóriamente responder aos requisitos mínimos de tamanho e complexidade documentados
    versao_leantime - Versão da release do software leantime a instalar - por exemplo: v2.1.7
    first_name_website - Primeiro nome do administrador do site
    last_name_website - Último nome do administrador do site
    company_website - Nome do site da empresa

Dependencies
------------

Sem dependencias.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { login_leantime: "adminLeanTimeDB", password_leantime: "P0ssW0rD###)", login_website: "utilizador@email.com", password_website: "Passw0rd###)Websit3", versao_leantime: "v2.1.7" }

License
-------

GPL 3.1

Author Information
------------------

Nuno Mourinho.
---
