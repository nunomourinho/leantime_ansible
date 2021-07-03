Role Name
=========

Este role instala a plataforma de gestão de projetos agil leantime num servidor ou máquina virtual com Ubuntu 20.04. O desenvolvimento deste role teve a sua origem no trabalho da cadeira de Segurança e Usabilidade do Software, do mestrado em Engenharia de Segurança Informática, na Escola Superior de Tecnologia e Gestão de Beja.  
Cada um dos commits deste role representa uma fase do TDI - Test Driven Infraestructure. Cada commit tem também dentro da pasta doc/asciinema um video dos passos executados. A metodologia do TDI consiste na criação de testes e depois na escrita do código para o teste passar. Sempre que possível, cada commit consiste apenas de um único passo, de teste ou de escrita de código para passar o teste.

Requirements
------------

Ubuntu 20.04 (focal). 

Instruções de instalação
------------
Para instalar este role no localhost é necessário instalar os requesitos do ansible e configurar as chaves publicas e privadas do servidor de ssh. Deverá proceder do seguinte modo:  
1) Instalar o sistema operativo ubuntu server versão 20.04 server  
2) apt install ansible git -y
3) ssh-keygen
4) nano /etc/ssh/sshd_config (colocar PermitRootLogin yes)
5) service sshd reload
6) ssh-copy-id 127.0.0.1
7) nano /etc/ssh/sshd_config (colocar PermitRootLogin prohibit-password)
8) service sshd reload
9) git clone https://github.com/nunomourinho/leantime_ansible.git
10)  nano leantime_ansible/vars/main.yml (editar login e pwd do administrador do site e da base de dados)
11) ansible localhost -v -m include_role -a name=leantime_ansible

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
      vars:
        - login_leantime: "adminLeanTimeDB"  
        - password_leantime: "P0ssW0rD###)"  
        - login_website: "utilizador@email.com"  
        - password_website: "Passw0rd###)Websit3"  
        - first_name_website: "Nuno"  
        - last_name_website: "Mourinho"  
        - company_website: "MESI"  
        - versao_leantime: "v2.1.7"  
      roles:
         - { role: leantime_ansible }                  

License
-------

GPL 3.1

Author Information
------------------

Nuno Mourinho.
---

Tutoriais em vídeo, passo a passo.
=========
Consultar: https://asciinema.org/~ngam-mesi ou pasta docs/asciinema
001 - Ansible lint - Teste para deteção de erros de sintaxe
---

Detectou os seguintes erros de falta de preenchimento no ficheiro (meta/main.yml):   
**platforms** - plataformas suportadas pelo role  
**author** - nome do autor do role  
**company** - nome da empresa  
**license** - licenca  
[![asciicast](https://asciinema.org/a/419965.svg)](https://asciinema.org/a/419965)
