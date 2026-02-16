Libft - @42

> Un projet initial de l'école 42, transformé en une bibliothèque C polyvalente et évolutive pour mes futurs projets (Pipex, Push_Swap, Fract-ol, etc.).

---

## 🛠️ À propos
La **Libft** est le premier projet du cursus 42. L'objectif est de recoder des fonctions de la bibliothèque C standard (`libc`) ainsi que d'autres fonctions utilitaires. 

**Particularité de ma version :** Au-delà du barème 42, j'enrichis continuellement cette bibliothèque avec de nouvelles fonctionnalités nécessaires à mes projets avancés (gestion de la mémoire, mathématiques, parsing).

---

## 📂 Structure du projet

L'arborescence est organisée par thématiques pour une meilleure maintenabilité :

* **`srcs/is/`** : Tests de caractères (isdigit, isalpha, etc.).
* **`srcs/mem/`** : Manipulation de mémoire (`ft_realloc`, `ft_free_str_tab`, etc.).
* **`srcs/str/`** : Manipulation de chaînes de caractères complexes (`ft_split`, `ft_strjoin_free`).
* **`srcs/to/`** : Conversions (atof, atoi, itoa, etc.).
* **`srcs/maths/`** : Fonctions mathématiques (`ft_sqrt`, `ft_pow`).
* **`srcs/lst/`** : Gestion complète de listes chaînées.
* **`srcs/put/`** : Fonctions d'affichage.

### 🌟 Modules intégrés
* **`ft_printf`** : Une version personnalisée de printf gérant plusieurs formats (`%c`, `%s`, `%p`, `%d`, `%i`, `%u`, `%x`, `%X`, `%%`).
* **`get_next_line`** : Fonction permettant de lire une ligne à la fois depuis un descripteur de fichier.

---

## 🛠️ Mise en place
### 1. Installation

Cloner le dépôt dans ton projet :
Bash

git clone git@github.com:fiaudfiz/libft.git

### 2. Compilation

Générer l'archive libft.a à la racine :
Bash

cd libft && make

## 3. Intégration dans un autre projet

Pour compiler ton propre code avec cette bibliothèque, utilise les flags suivants :
Bash

# Compilation
cc my_project.c -L. -lft -I./includes

    Note : -L. indique où chercher la lib, -lft lie libft.a, et -I./includes permet de trouver le header sans taper le chemin complet.

🧪 Tests & Fiabilité

Le code est régulièrement passé au crible pour garantir une stabilité maximale :

    Memory Leaks : Zéro fuite détectée avec Valgrind.

    Norminette : 100% conforme aux règles de l'école 42.

    Unit Tests : Testé avec Francinette et des testeurs maison pour les cas limites (segmentation faults sur pointeurs NULL, buffers vides, etc.).

