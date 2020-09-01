


 
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

1.  Une fois votre compte créé et votre instance initialisee, rendez-vous dans l'onglet " Browser" de ElephantSQL.
    Entrez cette instruction puis éxecutez la grâce au bouton "execute" : 

```SQL
CREATE TABLE IF NOT EXISTS "table_country" (
"country" TEXT NULL,
"pop" INT NULL,
"density" INT NULL,
"upload" TIMESTAMP
);
```

2.  Puis, il va falloir insérer les données de notre table : 
    Pour celà il suffit de vous rendre sur [insert_into](https://github.com/TOMCASS/P3_pays/blob/origin/developTom/creation_table/insert_into.sql), et de copier l'intégralité du fichier dans ElephantSQL sans oublier de l'éxecuter.

3.  Imports des fonctions : 
                                - Créer une fonction SQL qui retourne le pays (sous format de TABLE) qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays

```SQL
CREATE OR replace FUNCTION get_pays (pays TEXT) 
RETURNS TABLE (country TEXT,pop INT, density INT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country,table_country.pop,table_country.density FROM table_country WHERE table_country.country = pays;
END;
$$;
```








**Utilisation** 

Pour afficher le contenue de notre "table_country" il suffit d'éxecuter la requete :

```SQL
SELECT * FROM "public"."table_country" LIMIT 300
```

Ensuite 



**Usage** 





