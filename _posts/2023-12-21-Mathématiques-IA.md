---
layout: single
title:  Mathématiques-Intelligence Artificielle
date:   2023-12-21 15:25:05 +0200
categories: Mathématiques
tags: [Mathématiques, IA]
katex: true
toc: true
toc_label: "Contenu"
toc_sticky: true
comments: true
---

{% picture chapelle_sixtine_detail.jpg --alt chapelle Sixtine détail %}

# IA et Mathématiques #

Lorsqu'il s'agit de rendre compte des avancées de l'intelligence artificielle, il convient d'être particulièrement attentif à ne pas sombrer dans les deux écueils symétriques mais aussi stériles l'un que l'autre  que constituent l'émerveillement béat et le catastrophisme apocalyptique.

Ce qui suit relate l'émergence d'une collaboration inédite entre l'intelligence artificielle et l'homme, une collaboration exemplaire qui montre que l'intelligence artificielle n'a vocation à être ni un remplaçant ni un médiocre pis-aller mais un outil efficace  d'aide à la résolution de problèmes.

## Deepmind Londres 2023 ##

Dans un [article de Nature]((https://www.nature.com/articles/d41586-023-04043-w)) publié le 14 décembre de cette année, Bernardino Pomera-Paredes de l'équipe de Deepmind Londres expose comment l'utilisation combinée d'un &#171;grand modèle de langage&#187; (LLM) spécifiquement entraîné à la résolution de problèmes mathématiques et d'un programme &#171;prescripteur&#187; _FunSearch_ a permis d'imaginer une méthode originale de collaboration homme-machine.

## Le jeu _Set!_ ##

Inventé et commercialisé en 1974 par la généticienne britannique Marsha Falco le jeu Set! consiste en ensemble de 81 cartes représentant une, deux ou trois formes caractérisées par :

- une couleur (rouge, violet ou turquoise)
- une forme (ovale, losange ou vague)
- un mode de remplissage (plein, vide ou hachuré)

Le jeu comporte toutes les $$3^4 = 81$$ (nombre de symboles $$\times$$ nombre de formes $$\times$$ couleurs possibles $$\times$$ modes de remplissage) possibilités. Le but est d'identifier le plus rapidement possible l'apparition d'un triplé &#171;spécial&#187; appelé _set_ formé par trois cartes dont les attributs sont soit tous les mêmes soit tous distincts :

{% picture set.webp --alt le jeu Set! %}

Par exemple sur l'image de couverture est représenté un tel set puisque 

- les trois couleurs sont différentes
- les trois formes sont distinctes
- le nombre de figures est différent pour chaque carte (2,1,3)
- le mode de remplissage est le même (plein).

Au début du jeu on commence par étaler quatre rangées de 3 cartes. Si aucune rangée ne contient de set on ajoute une nouvelle rangée et ainsi de suite jusqu'à ce qu'un set soit détecté par l'un des joueurs.

## Le problème mathématique ##

L'objet de réflexion des mathématiciens est le suivant : peut-on calculer le plus grand nombre de cartes ne contenant aucun set ?

Pour cet exemple particulier la réponse a été donnée par le mathématicien italien Giuseppe Pellegrino en 1971 : 20.  
Mais le véritable intérêt _combinatoire_ de ce problème est que l'on peut aisément augmenter le nombre d'attributs des cartes (en ajoutant d'autres images par exemple).  Ainsi pour tout ensemble de $$n$$ caractéristiques on obtiendra un jeu de $$3^n$$ cartes et, pour chacun de ces jeux, on se propose de déterminer les collections de cartes ne contenant aucun set - étrangement appelés &#171;sets chapeaux&#187; (&#171;cap sets&#187;) par les mathématiciens - puis la taille maximale d'une telle collection (ou en langage mathématique leur &#171;borne supérieure&#187;). 

On connaît la réponse à ces questions pour un nombre de caractéristiques allant jusqu'à 6. Mais qu'en est-il lorsqu'on envisage 100 ou 200 attributs  et que le nombre de combinaisons à envisager dépasse largement nos possibilités de calcul ? La question générale (et équivalente) de déterminer le nombre minimal de cartes garantissant l'apparition d'au moins un set reste donc ouverte et constitue par ailleurs l'une des plus simples formulations d'une classe beaucoup plus générale de problèmes combinatoires appelée &#171;théorie de Ramsey&#187; dont le but est d'étudier jusqu'à quel point une collection d'objets peut croître avant de voir émerger en son sein des motifs identifiables. Et c'est ce qui explique son importance : tout progrès dans sa résolution peut conduire à des découvertes importantes dans cette théorie (par exemple une conjecture classique de théorie des nombres cherche à déterminer la taille maximale d'un ensemble de nombres premiers ne contenant aucun triplé en progression arithmétique - dont la différence est constante).


Originellement, suite à des publications de 1995 et 2012, on pensait que les sets chapeaux doivent avoir une taille inférieure à $$\frac{1}{n}$$ fois la taille du jeu complet ($$20 \sim \frac{81}{4}$$), mais la résolution d'une question proche a permis d'établir en 2016 que la valeur de la borne supérieure décroît _exponentiellement_ lorsque $$n$$ augmente (à titre d'exemple l'estimation primitive la limitait à $$0.5\%$$ pour 200 attributs alors que la nouvelle l'évalue à $$0.0000043\%$$).  
Il faut préciser qu'il s'agit là d'évaluations et non de la détermination  exacte de telles collections.

## L'avènement de l'IA ##

En collaboration avec des chercheurs de l'université de Lyon et de l'université du Wisconsin l'équipe londonienne de Deepmind a donc utilisé l'IA pour tenter  d'avancer dans la recherche de solutions exactes à ce problème de la borne supérieure de la taille des sets chapeaux.  
En élaborant un système d'intelligence artificielle appelé *FunSearch* pour créer automatiquement des requêtes à un LLM spécialisé, ces chercheurs ont réussi à faire produire à ce modèle de courts programmes informatiques fournissant des solutions à des problèmes mathématiques.  
FunSearch vérifie ensuite la validité des solutions produites et les compare aux solutions connues jusqu'ici. Si la comparaison n'est pas en faveur des réponses générées, le système fournit un &#171;feedback&#187; au modèle afin de perfectionner la solution attendue à l'issue de l'itération suivante.  
Non seulement le système a réussi à améliorer l'évaluation de la taille minimale de la collection garantissant l'apparition d'un set dans le cas de $$n=8$$ caractéristiques mais - plus important encore - il a matérialisé ce résultat dans une construction totalement originale et en utilisant un programme dont les étapes peuvent être analysées et comprises par ses utilisateurs, bien différemment donc des utilisations &#171;classiques&#187; de l'intelligence artificielle en tant que boîte noire.

## Qu'en retenir ? ##

Il est important de souligner que la classe des problèmes susceptibles d'être soumis à ce système reste pour l'instant déterminée par quelques contraintes relativement indépassables comme un ensemble de résultats antérieurs perfectionnables, la possibilité d'évaluer efficacement d'éventuelles solutions ou avoir à sa disposition un embryon de solution dont une partie isolée peut être améliorée.  
Le problème de la génération automatique de démonstrations de théorèmes, par exemple, sort complètement de ce cadre faute de pouvoir dans ce cas fournir au système un &#171;signal de notation&#187; *suffisamment riche*.  
A l'inverse, dans le problème précédent, les clauses que doivent satisfaire les solutions sont parfaitement claires.
Pour autant cette approche originale ouvre de prometteuses perspectives dans la résolution de nombreux problèmes - pas uniquement dans le domaine des mathématiques mais aussi dans celui des applications pratiques - par le biais d'un nouveau paradigme de la coopération homme-machine. Une coopération et non une substitution.  
Le mot de la fin revient à l'un des mathématiciens à l'origine du projet, [Jordan Ellenberg]((https://people.math.wisc.edu/~ellenberg/)) : &#171;Je ne cherche pas à l'utiliser (ce système) pour remplacer les mathématiciens humains mais comme un multiplicateur de force.&#187;

## Références  ##

1. <i class="fas fa-external-link-alt" aria-hidden="true"></i>  [L'article Nature](https://www.nature.com/articles/d41586-023-04043-w)
2. <i class="fas fa-external-link-alt" aria-hidden="true"></i> [La publication (preview)](https://www.nature.com/articles/s41586-023-06924-6)
3. <i class="fas fa-external-link-alt" aria-hidden="true"></i> [Un post de Timothy Gowers](https://gowers.wordpress.com/2016/05/19/reflections-on-the-recent-solution-of-the-cap-set-problem-i/)

