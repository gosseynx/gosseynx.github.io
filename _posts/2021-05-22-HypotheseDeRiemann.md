---
layout: single
title: l'hypothèse de Riemann
subtitle: Une conjecture moderne
categories: Mathématiques
tags : [Mathématiques]
katex: True
toc: true
toc_label: "Contenu"
toc_sticky: true
---

# L'hypothèse de Riemann #

## Les problèmes du Prix du Millénaire ## 

L'institut pour les Mathématiques [Clay (CMI)](http://claymath.org), un institut scientifique privé britannique situé à Oxford a publié le 24 Mai 2004 une liste de sept problèmes mathématiques (assorti d'un prix d'un million de dollars pour la résolution de chacun d'eux) considérés comme hardus : les *Millenium Prize Problems*:

1. Le problème $$P=NP$$.
2. La conjecture de Hodge
3. La conjecture de Poincaré (résolue)
4. **L'hypothèse de Riemann**
5. La résolution des équations de Yang-Mills
6. La conjecture de Birch et Swinnerton-Dyer
7. La solution générale des équations de Navier-Stockes

Le seul de ces problèmes à être considéré comme résolu est la conjecture de Poincaré qui l'a été par le mathématicien russe Grigori Perelman en 2003. Il a reçu la médialle Fields pour sa démonstration en 2006. Bien que celle-ci ait été reconnue par l'institut Clay en 2010, Perelman a décliné le prix.

## La fonction Zeta de Riemann ##

Le concept même de fonction est à la base de l'analyse enseignée dans le secondaire : il capture la mise en relation de deux grandeurs dont l'une, la *variable* a une progression connue (le temps par exemple) et une autre dont on étudie l'évolution par rapport à la première.

La fonction $$\zeta$$ de Riemann est définie par :

$$\zeta(s) = \sum_{n=1}^{+\infty}\frac{1}{n^s} = \frac{1}{1^s} + \frac{1}{2^s} + \frac{1}{3^s} + \dotsb$$

Cette fonction associe donc à un nombre réel $$s$$ la somme de la série précédente dont on sait qu'elle ne converge (que le résultat de cette somme infinie est un nombre réel) que si $$s>1$$.

Euler aux environs de 1730, dans le cadre de la résolution du *Problème de Basel*, à savoir démontrer l'égalité

$$\sum_{n=1}^{+\infty}\frac{1}{n^2}= \zeta(2) = \frac{\pi^2}{6}$$

a déterminé également une autre expression de la fonction $$\zeta$$ de Riemann :

$$\zeta(s) = \prod_{p \text{ premier}}\frac{1}{1-p^{-s}}$$

(formule que l'on établit également à l'aide de considérations élémentaires en probabilités) où le produit est étendu à l'infinité de tous les nombres premiers $$p$$.

## l'extension du domaine de définition ##

Définie au départ uniquement pour les nombres réels strictement supérieurs à $$1$$, la fonction $$\zeta$$ va s'étendre à un plus large ensemble de valeurs grâce à deux résultats.

Le premier est la relation vérifiée par la fonction $$\eta$$ de Dirichlet :

$$\biggl(1 - \frac{2}{2^s}\biggr) \zeta(s) = \eta(s) = \sum_{n=1}^{+\infty}\frac{(-1)^{n+1}}{n^s} \tag{1}$$

qui permet d'affirmer, comme la série de droite est alternée (et converge donc à condition que la suite $$\bigl(\frac{1}{n^s}\bigr)$$ tende vers $$0$$) que la convergence est maintenant étendue à tous les réels positifs.

Le second résultat consiste à étendre la fonction $$\zeta$$ aux valeurs *complexes* de $$s$$ (c'est à dire aux valeurs $$s = x + iy$$ où $$x$$ et $$y$$ sont des réels) en recourant au *principe de prolongement analytique*.
La fonction ainsi obtenue est *méromorphe* c'est à dire qu'elle est assez régulière pour être dérivée (par rapport à la variable complexe $$z$$) partout sur son domaine de définition *sauf sur un ensemble de points isolés* (les seuls dans une région les entourant en gros).
Puisque la restriction d'un tel prolongement aux valeurs réelles doit redonner la fonction de départ, le prolongement en question n'est valable que si la partie réelle de $$s$$ est stritement supériereure à $$1$$. Mais la relation $$(1)$$ permet d'étendre encore cette définition à tous les complexes dont la partie réelle est strictement positive *excepté* les points où le terme en facteur s'annulle :

$$1 - \frac{2}{2^s} = 0 \Leftrightarrow s= 1 + \frac{2i\pi n}{\ln 2}$$

pour tout entier naturel non nul $$n$$.

En fait la fonction $$\zeta$$ peut également être étendue à ces valeurs par l'intermédiare des limites en ces points sauf au point $$s=1$$ (qui donne la série harmonique divergente).

Dans la bande verticale comprise strictement entre $$x=0$$ et $$x=1$$ (tous les nombres complexes $$z = x+iy$$ dont la partie réelle est strictement comprise entre $$0$$ et $$1$$) la fonction $$zeta$$ vérifie l'équation *fonctionnelle* (égalité vérifiée pour l'ensemble des valeurs que prend la fonction) :

$$\zeta(s) = 2^s \pi^{s-1}\sin \biggl(\frac{\pi s}{2}\biggr)\Gamma(1-s)\zeta(1-s) \tag{2}$$

où apparaît la fonction spéciale dite *Gamma d'Euler* qui est définie  pour tout nombre complexe $$z$$ dont la partie réelle est strictement positive par :

$$\Gamma(z) = \int_0^{+\infty} t^{z-1}e^{-t} dt$$ 

La présence dans la relation $$(2)$$ des deux valeurs $$\zeta(s)$$ et $$\zeta(1-s)$$ permet enfin de prolonger encore le domaine de définition de la fonction $$\zeta$$ à tous les autres nombres complexes $$s$$ dont la partie réelle est négative, sauf pour $$s=0$$ (qui fait ressurgir la *singularité* $$s=1$$ dans le second membre) en égalant simplement $$\zeta(s)$$ au membre de droite de $$(2)$$.

## Les zéros de la fonction *zeta* ##

Si l'on reprend la formule $$(2)$$ on constate que $$\zeta(s) = 0$$  lorsque $$s$$ est un entier négatif puisqu'alors $$\sin \bigl(\frac{\pi s}{2}\bigr)=0$$ (si $$s$$ est un enrier pair positif les zéros de la fonction $$x \mapsto \sin x$$ sont compensés par les *pôles* de la fonction $$\Gamma$$ qui, elle, est calculée sur des valeurs entières *négatives* et la fonction $$\zeta$$ ne s'annulle pas en ces points).

 &nbsp;  
Ce sont les zéros *triviaux* de la fonction $$\zeta$$.

 &nbsp;  

La valeur $$\zeta(0) = - \frac{1}{2}$$ n'est pas obtenue à partir de l'équation $$(2)$$ mais en calulant $$\lim_{s\rightarrow 0}\zeta(s)$$.

L'équation fonctionnelle $$(2)$$ montre également que la fonction $$\zeta$$ ne possède aucun zéro à partie réelle négative autre que ses zéros triviaux. Ainsi, tous les zéros non triviaux de $$\zeta$$ résident dans la bande verticale du plan complexe délimitée par $$x=0$$ et $$x=1$$.

L'hypothèse de Riemman est que **tous** les zéros non triviaux de la fonction $$\zeta$$ sont situés exclusivement sur la droite d'équation $$x =\frac{1}{2}$$ (et donc ont tous pour partie réelle $$\frac{1}{2}$$) appelée *la droite critique*.

On effectue depuis des années de gigantesques calculs sur ordinateur pour essayer de vérifier cette hypothèse (en 2021 Platt&Trudgian ont vérifié cette hypothèse sur $$ 12\, 363\, 153\, 437\, 138$$ zéros !) sans avoir jusqu'à aujourd'hui réussi ni à démontrer cette conjecture vieille de 162 ans ni à trouver d'autres zéros dans cette bande *hors de la droite critique*.

Enfin, il se trouve que cette hypothèse est reliée à beaucoup d'autres résultats mathématiques notamment d'importantes considérations concernant la répartition des nombres premiers dans l'ensemble de tous les nombres entiers.

Plus précisemment le  théorème des nombres premiers donne une estimation du nombre de nombres premiers inférieurs à un réel $$x$$ ( noté $$\pi(x)$$) : celui-ci  est équivalent, lorsque $$x$$ tend vers l'infini à $$\frac{x}{\ln x}$$ ce qui donne une estimation de la répartition *moyenne* des nombres premiers. L'hypothèse de Riemann porte sur la *déviation* par rapport à cette moyenne.

On montre que l'estimation en question, lorsque $$x$$ devient très grand  (le seul cas intéressant, sinon on *calcule* effectivement la valeur exacte de ce nombre !) vérifie la relation  :

$$\pi(x) = \int_0^x \frac{dt}{\ln t} + O(\sqrt{x}\ln x)$$

et toute avancée dans l'exploration de la région des zéros de la fonction $$zeta$$ améliore le terme d'erreur du théorème des nombres premiers.

Lorsque l'on sait l'importance des  nombres premiers dans les systèmes de cryptographie, on réalise que la résolution de ce problème pourrait bien valoir plus d'un million de dollars...
