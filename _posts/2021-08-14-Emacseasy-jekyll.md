---
layout: single
title:  Emacs easy-jekyll
categories: Linux
date:   2021-08-14 15:16:25 +0200
---




## Blogger avec easy-jekyll depuis Emacs ##



![alt]({{ site.url }}{{ site.baseurl }}/assets/images/emacsred-80.png)


Publier des articles avec [emacs](https://www.gnu.org/software/emacs/) pour [Jekyll](https://jekyllrb.com/) peut être à la fois simple et _entièrement automatisé_. en utilisant le package [easy-jekyll](https://github.com/masasam/emacs-easy-jekyll).

&Agrave; une seule condition. La configuration initiale de Jekyll recommande d'utiliser des gems Ruby sur une base locale et de les conserver sous le répertoire `~/gems/`.
La conséquence est qu'Emacs ne trouvera pas le binaire `jekyll` à cet emplacement inhabituel.


Une sournoise petite difficulté qui peut prendre du temps à être résolue puisque le package refusera de se lancer avec un laconique "jekyll is not installed".


Heureusement la solution est directe : il suffit d'indiquer à Emacs où trouver cet executable : dans le fichier d'initialisation `~/emacs.d/init.el` avant les quelques lignes de configuration requises décrites sur le site d'easy-jekyll (et qui dépendent des moyens de publication du blog) il faut placer :


```lisp
(setenv "PATH" (concat (getenv "PATH") ":~/gems/bin"))
(setq exec-path (append exec-path '("~/gems/bin")))
```

Une fois Emacs ouvert un simple  `M-X easy-jekyll` placera l'éditeur dans le répertoire local où sont stockés les différents posts  et affichera les commandes pour automatiser rédaction et publication !
