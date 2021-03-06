


 
# Les pays en chiffre<br/>


## Sommaire

1. #### Description
2. #### Prérequis
3. #### Installation

                - a : Création de la table
                - b : Création de la 1ère fonction
                - c : Création de la procédure 
                - d : Création de la 2ème fonction
                - e : Configuration du Trigger
                - f : Insérer les données de notre table


4. #### Utilisation / Usage

                - a : Requête pour afficher le contenue de notre table / afficher la ligne complète d'un pays
                - b : Requête à effectuer pour executer la 1ère fonction établie 
                - c : Requête à effectuer pour executer la procedure précedemment établie
                - d : Requête à effectuer pour executer la 2ème fonction établie
<br/><br/>

**1. Description du projet**
-----------------------------------------------------------------------------------------------------------------------------

**Vous devez choisir les outils à utiliser, le python n'est pas autorisé il faut utiliser seulement le langage SQL avec la base de données PostgreSql. Vous devez impérativement passer par le SAAS elephantsql (version gratuite)**

**Vous devez :**

                - Créer une fonction SQL qui retourne le pays (sous format de TABLE) qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays
                - Créer une procédure SQL qui insert un nouveau pays avec des données random (on précise uniquement le pays)
                - Configurer un trigger qui va mettre à jour la colonne de la table correspondant à la date de l'insertion
                - Réaliser une fonction ou procédure stoquée pour retourner les pays qui sont regroupés par 4 tranches (à definir) de densité de population



**2. Prérequis**
-----------------------------------------------------------------------------------------------------------------------------

**Vous devez :**

                - Avoir un compte sur https://www.elephantsql.com/ 
                - Avoir créé une instance toujours sur https://www.elephantsql.com/
                


**3. Installation**
-----------------------------------------------------------------------------------------------------------------------------

__a.__  
    
Une fois votre compte créé et votre instance initialisée, rendez-vous dans l'onglet " Browser" de ElephantSQL.
Entrez cette instruction pur créer notre table, puis éxecutez-la grâce au bouton "execute" : 

```SQL
CREATE TABLE IF NOT EXISTS "table_country" (
"country" TEXT NULL,
"pop" INT NULL,
"density" INT NULL,
"upload" TIMESTAMP
);
```

__b.__ 

Nous allons maintenant importer la procédure SQL ci-dessous qui retourne le pays (sous format de TABLE) 
qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays : 

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

__c.__

Nous allons maintenant importer la procédure SQL ci-dessous qui retourne le pays (sous format de TABLE) 
qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays :

```SQL
CREATE OR replace PROCEDURE insert_data(pays TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO table_country(country,pop,density) VALUES (pays, random() * 10000, random() * 10000);
END;
$$;
```


__d.__

Nous allons créer une fonction permettant de retourner les pays qui seront regroupés par tranches de 4 (à definir)
de densité de population:

```SQL
CREATE OR replace FUNCTION categories () 
RETURNS TABLE (country TEXT,pop INT, density INT, tranche TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country, table_country.pop, table_country.density, CASE
WHEN table_country.density > 500 THEN 'tranche4'
WHEN table_country.density > 400 THEN 'tranche3'
WHEN table_country.density > 300 THEN 'tranche2'
ELSE 'tranche1' END AS tranche
FROM table_country;
END;
$$;
```
*On peut aussi créer la même fonction mais pour un seul pays (de notre choix) :*

```SQL
CREATE OR replace function categories (pays TEXT) 
RETURNS TABLE (country TEXT,pop INT, density INT, tranche TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query 
SELECT table_country.country, table_country.pop, table_country.density, CASE
WHEN table_country.density > 500 THEN 'tranche4'
WHEN table_country.density > 400 THEN 'tranche3'
WHEN table_country.density > 300 THEN 'tranche2'
ELSE 'tranche1' END AS tranche
FROM table_country WHERE table_country.country = pays;
END;
$$;
```
__e.__

Nous allons configurer un trigger qui va mettre à jour la colonne de la table correspondant à la 
date de l'insertion.
Tout d'abord la création d'une fonction :

```SQL
CREATE OR REPLACE FUNCTION data_upload() RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
NEW.upload := current_timestamp;
RETURN NEW;
END;
$$;
```
Puis nous allons importer notre Trigger après avoir exécuté la fonction ci-dessus :

```SQL
CREATE TRIGGER data_upload BEFORE INSERT OR UPDATE ON table_country      
FOR EACH ROW EXECUTE PROCEDURE data_upload();
```

__f.__

Il va falloir maintenant insérer les données de notre table :
Pour cela il suffit de vous rendre sur le lien : <br/>
[insert_into](https://github.com/TOMCASS/P3_pays/blob/master/creation_table/insert_into.sql), et de copier l'intégralité du fichier dans ElephantSQL sans oublier de l'exécuter.<br/><br/><br/>



**4. Utilisation / Usage** 
-----------------------------------------------------------------------------------------------------------------------------

__a.__

Requête a effectuer pour afficher le contenue de notre "table_country" il suffit d'exécuter la requête (on précise 300 pour avoir l'intgralité des pays):

```SQL
SELECT * FROM "public"."table_country" LIMIT 300
```

Requête a effectuer pour afficher la ligne complète d'un pays (ici la Chine)

```SQL
SELECT * FROM "table_country"
WHERE country = 'China';
```

__b.__

Requête à effectuer pour afficher la 1ère fonction établie (ici la France)

```SQL
SELECT * FROM get_pays('France')
```

__c.__

Requête à effectuer pour executer la procedure précedemment établie (ici le nouveau pays la 'Cool-Zanie')

```SQL
CALL insert_data('Cool-Zanie')
```

__d.__

Requête à effectuer pour afficher la 2ème fonction établie (ici le nouveau pays la 'Cool-Zanie')

```SQL
SELECT * FROM categories('Cool-Zanie')
```

* Requête à effectuer pour afficher la 2ème fonction établie (ici tout les pays de la table "table_country")

```SQL
SELECT * FROM categories()
```

#### Merci d'avoir lu mon README :-)




