

1ère étape:
----------

===> Se rendre sur https://www.elephantsql.com/:

                                                        créer un compte,
                                                        choisir un serveur (dans mon cas Europe => Irlande, car gratuit)


2ème étape:
----------
===> Nettoyage des différentes catégories du fichier CSV :  
                                                        enlever les colonnes inutiles,
                                                        enlever les majuscules (titres des colonnes), 
                                                        remplacer les espaces par des underscore (titres des colonnes)




3ème étape:  
----------

===> convertion du fichier CSV

Un moyen pratique est de se rendre sur : 
https://numidian.io/convert afin de déposer le nouveau fichier CSV épuré précedemment.
(On demandera bien entendu une convertion de celui-ci au format SQL)

Puis se rendre dans ElephantSQL, onglet BACKUP, déposer le nouveau fichier CSV transformé précédemment en .sql


4ème étape:
----------

                                                        