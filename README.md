


 

démarrage / usage

# Les pays en chiffre


**Description du projet**

Vous devez choisir les outils à utiliser, le python n'est pas autorisé il faut utiliser seulement le langage SQL avec la base de données PostgreSql

Vous devez impérativement passer par le SAAS elephantsql (version gratuite)

Vous devez :

                - Créer une fonction SQL qui retourne le pays (sous format de TABLE) qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays
                - Créer une procédure SQL qui insert un nouveau pays avec des données random (on précise uniquement le pays)
                - Configurer un trigger qui va mettre à jour la colonne de la table correspondant à la date de l'insertion
                - Réaliser une fonction ou procédure stoquée pour retourner les pays qui sont regroupés par 4 tranches (à definir) de densité de population


**Prérequis**

Vous devez: 

                - Avoir un compte sur https://www.elephantsql.com/ 
                - Avoir créé une instance toujours sur https://www.elephantsql.com/ (dans mon cas Europe => Irlande, car gratuit)


**Installation**

Une fois votre compte créé et votre instance initialisee, rendez-vous dans l'onglet " Browser" de ElephantSQL.
Entrez cette instruction puis éxecutez la grâce au bouton "execute" : 

```SQL
CREATE TABLE IF NOT EXISTS "table_country" (
"country" TEXT NULL,
"pop" INT NULL,
"density" INT NULL,
"upload" TIMESTAMP
);
```
Puis, il va falloir insérer les données de notre table : 
Pour celà il suffit de vous rendre sur ce lien, de copier l'intégralité du fichier dans ElephantSQL 
[insert_into](https://github.com/TOMCASS/P3_pays/blob/origin/developTom/creation_table/insert_into.sql)











**2ème étape**

===> Nettoyage des différentes catégories du fichier CSV :  

                                                                - enlever les colonnes inutiles (Yearly Change,Net Change, Land Area (Km²),Migrants (net),Fert. Rate,Med. Age,Urban Pop %,World Share)
                                                                - Pour les titres des colonnes restantes (country,pop,density) remplacer les majuscules par des minuscules. 
                                                                - remplacer les espaces par des underscore (titres des colonnes)


**3ème étape** 

===> Convertion du fichier CSV

Un moyen pratique est de se rendre sur : <br/>
https://numidian.io/convert afin de déposer le nouveau fichier CSV épuré précedemment.<br/>
Déposer 
(On demandera bien entendu une convertion de celui-ci au format SQL)

Puis se rendre dans ElephantSQL, onglet BACKUP, déposer le nouveau fichier CSV transformé précédemment en .sql


**4ème étape**

===> 

Pour afficher l'integralité de la table (affinée tout de même) :		
 
SELECT * FROM "public"."table_country" LIMIT 300
                                                        