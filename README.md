



# Les pays en chiffre


**1ère étape**

===> Se rendre sur https://www.elephantsql.com/ :

                                                            - créer un compte ou se connecter
                                                            - choisir un serveur (dans mon cas Europe => Irlande, car gratuit)


**2ème étape**

===> Nettoyage des différentes catégories du fichier CSV :  
                                                            - enlever les colonnes inutiles :
                                                                                                - Yearly Change
                                                                                                - Net Change
                                                                                                - Density 
                                                                                                - Land Area
                                                                                                - Migrants 
                                                                                                - Fert. Rate
                                                                                                - Med. Age
                                                                                                - Urban Pop 
                                                                                                - World Share

                                                            - Pour les titres des colonnes restantes (country,pop,density), remplacer les majuscules par des minuscules. 

                                                            - remplacer les espaces par des underscore (titres des colonnes)




**3ème étape** 

===> convertion du fichier CSV

Un moyen pratique est de se rendre sur : <br/>
https://numidian.io/convert afin de déposer le nouveau fichier CSV épuré précedemment.<br/>
(On demandera bien entendu une convertion de celui-ci au format SQL)

Puis se rendre dans ElephantSQL, onglet BACKUP, déposer le nouveau fichier CSV transformé précédemment en .sql


**4ème étape**


                                                        