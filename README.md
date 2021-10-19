## Beschreibung

### Ansible. TLS (NGINX+Let's Encrypt)

#### Roles description

Rollen ermöglichen es Ihnen, aus kleineren Teilen für verschiedene Situationen und Lösungen ein Playbook für verschiedene Aufgaben zusammenzustellen. Und Sie müssen nicht von Anfang an Skripte schreiben.

#### Verwenden von Rollen auf Play Niveauen

```
- hosts: 
  - webservers
  become: true
  become_method: sudo
    
  roles:
    - { role: nginx, tags: web_install }
    - { role: vhosts, tags: make_hosts }
    - { role: TLS, tags: make_cert }

```

```shell
     
     ansible-playbook -i ./ansible/inventories/webservers/hosts.yml ./ansible/nginx.yml --list-task  
     
```
  
  play #1 (all): all    TAGS: []  
    tasks:  
      nginx : install Nginx und Letsencrypt on Ubuntu   TAGS: [web_install, webservers_ubuntu]  
      nginx : install Nginx, EPEL, setrubleshoot und Letsencrypt on centos  TAGS: [web_install, webservers_centos]  
      nginx : copy the nginx config file on ubuntu  TAGS: [nginx_conf_ubuntu, web_install]  
      nginx : copy the nginx config file on centos  TAGS: [nginx_conf_centos, web_install]  
      vhosts : add folder for item and sertifications virtual hosts on ubuntu   TAGS: [add_opt_folders_ubuntu, make_hosts]  
      vhosts : add folder for item and sertifications virtual hosts on centos   TAGS: [add_opt_folders_centos, make_hosts]  
      vhosts : Remove default nginx config on ubuntu    TAGS: [del_default_ubuntu, make_hosts]  
      vhosts : Remove default nginx config on centos    TAGS: [del_default_centos, make_hosts]  
      vhosts : copy the nginx vhotsts config file and the content of the web site on ubuntu TAGS: [erste_templates_ubuntu, make_hosts]  
      vhosts : copy the nginx vhotsts config file and the content of the web site on centos TAGS: [erste_templates_centos, make_hosts]  
      vhosts : Check NGINX configs on ubuntu    TAGS: [check_nginx_ubuntu, make_hosts]  
      vhosts : Check NGINX configs und set SELinux on centos    TAGS: [make_hosts, virtualhost]  
      vhosts : Flush handlers TAGS: [make_hosts]  
      TLS : take cert from letsencrypt on ubuntu    TAGS: [letsencrypt_cert_ubuntu, make_cert]  
      TLS : take cert from certbot on centos    TAGS: [certbot_cert_centos, make_cert]  
      TLS : Add letsencrypt cronjob for cert renewal on ubuntu  TAGS: [cron_cert_ubuntu, make_cert]  
      TLS : Add certbot cronjob for cert renewal on centos  TAGS: [cron_cert_centos, make_cert]  
      TLS : Aktualisieren der Diffie-Hellman-Parameter  TAGS: [hellman, make_cert]  
      TLS : copy the new 443 nginx vhotsts config file on ubuntu    TAGS: [make_cert, new_host_ubuntu]  
      TLS : copy the new 443 nginx vhotsts config file on centos    TAGS: [make_cert, new_host_centos]    
      

  
#### Zieldateien für Rolle

`./roles/{name of specific role}/{vars,tasks,handlers}/`

## Methoden der Erstellung

1. Bereitstellen einer virtuellen Maschine mit Hilfe von Terraform auf DO und A-Record auf Route 53 von AWS:

```shell
    terraform apply -var-file=terrafor.tfvars
    oder 
    terraform apply -var-file=variables.tf
```
2. Bereitstellen virtueller Hosts in der Cloud mit Hilfe von Ansible:

```shell
    ansible-playbook -i ./ansible/inventories/webservers/hosts.yml ./ansible/nginx.yml
```

## die Ergebnisse

1. Nach der Anwendung können Sie die Ergebnisse sehen

```shell
    cat outputs_result.csv
```
**P.S. Beachtung! Ändern Sie die Werte der Variablen in Ihre eigenen!**

## License

GNU
