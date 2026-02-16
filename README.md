# Libft - @42

Le projet initial de l'école 42, une mini bibliotheque en C, qui peut servir de base pour divers projets.
Ce projet a ete realise dans le cadre de l'ecole 42, et contient toutes fonctions du suejt, et elle a ete amelioree par la suite.

---

##  Structure du projet

L'arborescence est organisée par thématiques pour une meilleure maintenabilité :

* **`srcs/is/`** : Tests de caractères (isdigit, isalpha, etc.).
* **`srcs/mem/`** : Manipulation de mémoire (`ft_realloc`, `ft_free_str_tab`, etc.).
* **`srcs/str/`** : Manipulation de chaînes de caractères complexes (`ft_split`, `ft_strjoin_free`).
* **`srcs/to/`** : Conversions (atof, atoi, itoa, etc.).
* **`srcs/maths/`** : Fonctions mathématiques (`ft_sqrt`, `ft_pow`).
* **`srcs/lst/`** : Gestion complète de listes chaînées.
* **`srcs/put/`** : Fonctions d'affichage.
* **`srcs/printf/`** : Fonction printf.
* **`srcs/get_next_line`** : lire un fichier ligne par ligne (Projet 42).
---

## Mise en place
### 1. Installation

Cloner le dépôt dans ton projet :
```bash
git clone git@github.com:fiaudfiz/libft.git
```
### 2. Compilation

Générer l'archive libft.a à la racine :

```bash
cd libft && make
```
### 3. Intégration dans un autre projet

Pour compiler ton propre code avec cette bibliothèque, utilise les flags suivants :

```bash
cc my_project.c -L. -lft -I./includes
```
    Note : -L. indique où chercher la lib, -lft lie libft.a, et -I./includes permet de trouver le header sans taper le chemin complet.
