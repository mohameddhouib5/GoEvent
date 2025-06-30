# Documentation Go Event

## Description
Go Event est une application mobile développée avec Flutter qui permet aux utilisateurs de gérer et participer à des événements. L'application offre une interface utilisateur intuitive pour la création, la recherche et la gestion d'événements.

## Fonctionnalités Principales

### 1. Gestion des Comptes
- Inscription des utilisateurs
- Connexion sécurisée
- Mise à jour du profil utilisateur

### 2. Gestion des Événements
- Création d'événements
- Recherche d'événements
- Réservation d'événements
- Gestion des événements réservés
- Participation aux événements

### 3. Interface Utilisateur
- Design moderne et responsive
- Navigation intuitive
- Pages de confirmation pour les actions importantes
- Système de recherche avancé

## Structure du Projet

### Fichiers Principaux
- `main.dart` : Point d'entrée de l'application
- `home.dart` : Page d'accueil
- `login.dart` : Page de connexion
- `signup.dart` : Page d'inscription
- `addevent.dart` : Création d'événements
- `searchpage.dart` : Recherche d'événements

### Base de Données
- Utilisation de SQLite pour le stockage local
- Gestion des données via `database_helper.dart`

## Dépendances Principales
- `image_picker` : Pour la sélection d'images
- `intl` : Pour le formatage des dates
- `sqflite` : Pour la gestion de la base de données
- `hive` : Pour le stockage local
- `flutter_picker` : Pour les sélecteurs personnalisés

## Configuration Requise
- SDK Flutter : >=3.1.3 <4.0.0
- Plateformes supportées : Android, iOS, Web, Windows, Linux, macOS

## Installation

1. Cloner le projet
2. Installer les dépendances :
```bash
flutter pub get
```
3. Lancer l'application :
```bash
flutter run
```

## Architecture
L'application suit une architecture modulaire avec :
- Séparation claire des responsabilités
- Gestion d'état locale
- Stockage persistant des données
- Interface utilisateur réactive

## Sécurité
- Stockage sécurisé des données utilisateur
- Validation des entrées
- Gestion des sessions

## Support
Pour toute question ou assistance, veuillez contacter l'équipe de développement.

## Licence
Ce projet est privé et n'est pas destiné à être publié sur pub.dev. 