dans un environnement de production,
le fichier registry.key doit être gardé secret 
(dans un répertoire bien protégé avec accès "root" ou "..." seulement)
----
Exceptionnellement , dans cette config de "vm" de "test/pré-production" ,
le fichier registry.key sera exposé dans un sous répertoire de vagrant
pour ne pas devoir re-générer un fichier à contenu pour varier
et ne pas avoir à re-déployer regulièrement la nouvelle contre-partie 
publique ".crt" (cohérente) sur beaucoup d'autre "vm" .