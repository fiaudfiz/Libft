# Libft - @42

The initial project of School 42, a mini-library in C, which can serve as a basis for various projects. This project was created within the framework of School 42, and contains all the functions of the subject, and it has been improved subsequently.

---

##  Project structure

The tree structure is organized by theme for better maintainability:

* **`srcs/is/`** : ASCII tests (isdigit, isalpha, etc.).
* **`srcs/mem/`** : Memory manipulation (`ft_realloc`, `ft_free_str_tab`, etc.).
* **`srcs/str/`** : String manipulation (`ft_split`, `ft_strjoin_free`).
* **`srcs/to/`** : Conversions (atof, atoi, itoa, etc.).
* **`srcs/maths/`** : Mathematical functions (`ft_sqrt`, `ft_pow`).
* **`srcs/lst/`** : Complete management of linked lists.
* **`srcs/put/`** : Display functions.
* **`srcs/printf/`** : Printf function.
* **`srcs/get_next_line`** : Read a file line by line (Project 42).
---

## Set up
### 1. Installation

Clone the repository into your project:

```bash
git clone git@github.com:fiaudfiz/libft.git
```
### 2. Compilation

Generate the libft.a archive in the root directory:

```bash
cd libft && make
```
### 3. Integration into another project
To compile your own code with this library, use the following flags:

```bash
cc my_project.c -L. -lft -I./includes
```
    Note : -L. indique où chercher la lib, -lft lie libft.a, et -I./includes permet de trouver le header sans taper le chemin complet.
