# Système de Gestion d'Entrepôt

## Introduction

Ce document examine le code source d'un système de gestion d'entrepôt développé en utilisant le framework Qt et le langage QML pour l'interface utilisateur. Le système est conçu pour gérer les utilisateurs, les produits, les catégories, et la navigation entre différentes vues.

## Structure du Code

Le code est divisé en deux principaux fichiers: `MasterController.h` et un fichier QML (`main.qml`). Le fichier d'en-tête `MasterController.h` définit une classe `MasterController` qui agit comme un contrôleur principal du système. Il contient également des propriétés QML telles que `NavigationController`, `welcomeMessage`, `user`, et `product`.

Le fichier QML `main.qml` représente l'interface utilisateur principale. Il utilise plusieurs vues (fichiers QML distincts) pour afficher différentes fonctionnalités, telles que l'ajout de produits, le tableau de bord, la recherche de produits, etc. La navigation entre ces vues est gérée par le `NavigationController` dans `MasterController`.

## Classes Principales

### 1. **MasterController**

- **Responsabilité:** Agit comme un contrôleur principal pour la gestion de l'entrepôt.
  
- **Propriétés QML:**
  - `NavigationController`: Gère la navigation entre les différentes vues.
  - `welcomeMessage`: Message de bienvenue affiché sur l'interface.
  - `user`: Instance de la classe `Users` (représentant un utilisateur).
  - `product`: Instance de la classe `Product` (représentant un produit).

### 2. **NavigationController**

- **Responsabilité:** Gère la navigation entre les différentes vues de l'application.

### 3. **Users, Product**

- **Responsabilité:** Représentent respectivement un utilisateur et un produit.

- **Signaux:**
  - `goAddProductView`: Signale la navigation vers la vue d'ajout de produit.
  - `goCategoryView`: Signale la navigation vers la vue de catégorie.
  - `goDashboardView`: Signale la navigation vers le tableau de bord.
  - `goEditProductView`: Signale la navigation vers la vue d'édition de produit avec le produit sélectionné.
  - `goFindProductView`: Signale la navigation vers la vue de recherche de produit.
  - `goLoginView`: Signale la navigation vers la vue de connexion.
  - `goRegisterView`: Signale la navigation vers la vue d'inscription.

## Singleton - Gestion des Données

- **Responsabilité:** Gère la lecture et le chargement des données depuis des fichiers JSON. Permet également d'ajouter un nouvel utilisateur au fichier JSON.

- **Propriétés:**
  - `version`: Version du singleton.
  - `colourBackground`: Couleur de fond.
  - `products`: Liste des produits.
  - `categories`: Liste des catégories.
  - `newUser`: Nouvel utilisateur à ajouter.

### 4. **Vues QML**

- Plusieurs fichiers QML (par exemple, `AddProductView.qml`, `DashboardView.qml`, `FindProductView.qml`, etc.) représentent différentes vues de l'application.

## Fonctionnalités Principales

1. **Affichage des Vues:**
   - Les différentes vues sont affichées dans une fenêtre principale.
   - La vue par défaut est le tableau de bord.

2. **Navigation:**
   - La navigation entre les vues est gérée par des boutons dans la barre de navigation latérale.

3. **Propriétés QML:**
   - Les propriétés QML, telles que `welcomeMessage`, sont utilisées pour afficher des informations sur l'interface utilisateur.

4. **Gestion des Utilisateurs et Produits:**
   - Les informations sur les utilisateurs et les produits sont gérées par les instances des classes `Users` et `Product` dans `MasterController`.

## Conclusion

Ce système de gestion d'entrepôt utilise le framework Qt et QML pour fournir une interface utilisateur interactive et dynamique. La structure du code est modulaire, facilitant la maintenance et l'extension du système. Le `MasterController` agit comme un point central pour coordonner différentes fonctionnalités, tandis que le `NavigationController` gère la navigation entre les vues. Ce document technique offre une vue d'ensemble détaillée de l'architecture du système.
