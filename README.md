# Drupal :) Welcome

Génération d'un environnement de developpement Drupal

## A quoi sert ?

Ce projet permet d'avoir une environnement Drupal de developpement dockerisé utilisant nginx - php 8.1 - mariadb

## Comment faire afin de lancer mon serveur ?

La première étape et de personnaliser, si c'est souhaité, la configuration nginx liée à votre projet : `docker/nginx/config/default.conf` 

## Comment choisir mon serveur BDD ?

Selon le besoin, le developpeur pourra créer et choisir la base de données à utiliser.
Les configurations de connexion sont indiquées au sein du fichier docker-compose.yml.
Ces Variable sont misent au sein d'un fichier .env, non versionné, créé à partir du fichier .env.local, à personnaliser !

## Comment Lancer mon serveur web ?

A ce projet, un fichier Makefile, qui peut etre améliorer et évoluer, afin de commencer les premiers pas sur l'application.
Pour chaque nouvelle installation la commande `make install` permet d'installer le projet de zéro 

> Il faudra faire attention au différentes commandes qui sont déjà inclus ! 
> Les commande `make install` - `make reinstall` - `make reset-*` - `make destroy` font très mal !!

> [!IMPORTANT]
> ce n'est pas un outil de production en état eactuelle masi c'est une solution ne dépondant pas de connaissance approfondiesen drupal ou en devops afin de la maitriser !

## Axe d'amélioration
> [!TIP]
> Plusieurs axes d'améliorations sont à venir telque, à titre d'exemple, ajouter des liens symboliques entre les dossiers customs et le projets afin d'extraire cette partie et ne pas casser l'application !
> Y a aussi l'idée d'encapsuler toute la partie installation drupal dans l'image du container `php` qui lui peut etre replacer par `app`

ce projet sera mit à jour à chaque fois que le temps le permets !

> [!NOTE]
> Vous pouvez faire des PRs afin de l'améliorer ou utuliser un fork ;) 