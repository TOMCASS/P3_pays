



-- 1. Pour afficher l'integralité de la table (affinée tout de même) :		

SELECT * FROM "public"."table_country" LIMIT 300

-- 2. Pour afficher la ligne cmplète d'un pays (ici la Chine)

SELECT * FROM "table_country"
WHERE country = 'China';

-- 3. Requete à effectuer pour executer la 1ère fonction établie (ici la France)

SELECT * FROM get_pays('France')

-- 4. Requete à effectuer pour executer la procedure établie (ici le nouveau pays 'cool')

CALL insert_data('cool')

-- 5. Requete à effectuer pour executer la 2ème fonction établie (ici la France)

SELECT * FROM categories('France')

-- 6. Requete à effectuer pour executer la 2ème fonction établie (ici tout les pays de la table "table_country")

SELECT * FROM categories()