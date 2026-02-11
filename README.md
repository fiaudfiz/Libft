📚 Libft - @42

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