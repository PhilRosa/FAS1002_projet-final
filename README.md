# FAS1002_projet-final

[![](https://img.shields.io/badge/Licence-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/deed.fr)

Dans ce projet, les fichiers principaux sont **import.qmd, export.qmd, index.qmd**, **environnement_datas.R**, **exploration.qmd** et **\_quarto.ym**l.

## Import.qmd

Dans ce fichier se retrouve toutes les bases de données utilisées pour la création des tableaux et des graphiques servant d'analyse. Il faut tout simplement run le script et s'assurer que les packages nécéssaires soient installés (voir plus bas).

## Exploration.qmd

Dans ce fichier, on y retrouve tous les codes utilisés pour la création des tableaux et des graphiques de même que l'analyse des ceux-ci.

## Index.qmd

Ce fichier constitue la page d'acceuil du site web et sert de mise en contexte pour le projet. On y retrouve une image avec la source représentant le thème du travail et on peut y lire la mise en contexte et l'objectif du projet.

## Intro.qmd

Dans ce fichier, il n'y a pas vraiment d'informations très pertinentes. Il ne s'agit que d'une introduction au travail et décrit très brièvement l'approche à l'analyse.

## environnement_datas.R

Ce fichier est le plus important au fonctionnement du travail. Il s'agit du fichier source de l'ensemble des script et est utilisé pour chacun d'entre-eux en première ligne de code. Pour le lire, il faut cependant avoir les packages fs et lubridate pour pouvoir utiliser la source. Dans ce fichier, on y retrouve plusieurs éléments:

-   Les packages

-   Le téléchargement de la banque de données

-   Les nouvelles banques de données (modification de l'originale)

## -quarto.yml

Ce fichier est la source principale de la mise en place du site web. Certaines modifications y ont été apportées par rapport à la branche principale donc il est pertinent d'y porter attention. Le fichier permet de voir la structure du site web de même que l'organisatio et les changements de thèmes.

Le reste des fichier sont assez explicites et ne nécéssites pas vraiment d'explication.

## Auteur:

Bertrand Turcotte et Philippe Rosa

## Remerciements:

Merci à Samuel Guay pour son soutien et son mentorat tout au long de la session.

## Principaux packages R utilisés dans ce site qui sert d'exemple:

-   R Core Team (2020). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. <https://www.R-project.org/>

-   H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016. <https://ggplot2.tidyverse.org>

-   Joe Cheng, Bhaskar Karambelkar and Yihui Xie (2021). leaflet: Create Interactive Web Maps with the JavaScript 'Leaflet' Library. R package version 2.0.4.1. <https://CRAN.R-project.org/package=leaflet>

-   C. Sievert. Interactive Web-Based Data Visualization with R, plotly, and shiny. Chapman and Hall/CRC. Florida, 2020. <https://plotly-r.com>

-   Jennifer Bryan (2017). gapminder: Data from Gapminder. R package version 0.3.0. <https://CRAN.R-project.org/package=gapminder>

-   Jim Hester, Hadley Wickham, Gábor Csárdi (2021). fs: Cross-Platform File System Operations Based on 'libuv'. [https://fs.r-lib.org](https://fs.r-lib.org/), <https://github.com/r-lib/fs>

-   library (readxl)

-   library(lubridate)

-   library(tidyverse)

-   library(countrycode)

-   library(skimr)

-   library(ggplot2)

-   library(ggthemes)

-   library(arsenal)

-   library(vtable)

-   library(patchwork)

-   library(rstatix)

## Licence

Cette œuvre est mise à disposition selon les termes de la [licence Creative Commons Attribution - Partage dans les Mêmes Conditions 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/deed.fr).

[![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/deed.fr)
