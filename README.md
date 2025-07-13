***METTRE EN PLACE UNE SUPERVISION EN DEFINISSANT LES SONDES SUR LES SERVEURS***


**CONSIGNES**

Considérons que l’entreprise X possèdent plusieurs serveurs :
1) 1 Windows server 2022 avec les rôles Active Directory DNS et DHCP
2) 1 Windows server 2022 de fichiers hébergeant les données de l’entreprise
3) 1 Debian 11 avec Apache/PHP et hébergeant le système de ticket de l’entreprise
4) 1 Ubuntu server 22.04 avec Nginx et hébergeant l’intranet de l’entreprise
5) 1 Windows server 2022 hébergeant WSUS
6) 1 Windows server 2022 hébergeant la base de données (sous MySQL) du logiciel RH de l’entreprise

Considérons que l’entreprise X possèdent plusieurs équipements réseaux :
1) Un switch de niveau 2 dédié à la connectivité des différents ordinateurs
2) Un routeur/firewall
3) Une box internet

**OBJECTIF**

•	L’objectif ici est de définir toutes les sondes que vous mettriez en place sur chaque serveur/équipements réseaux et justifier le choix de celles-ci. 
•	Nous pouvons considérer que l’entreprise souhaite utiliser Nagios comme outil de supervision en l’installant sur un serveur Linux.
•	Vous n’oublierez pas de citer vos sources et sur quels documents/organismes vous avez appuyez vos recommandations d’indications.

