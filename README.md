# Books service API

API Java Springboot qui renvoie des données relatives à des comics.

Lien de l'application web Angular pour afficher les données : https://github.com/Nayzow/books-service-backend

## Get Started

#### 1. Clonez le dépôt du projet en utilisant la commande

```bash
git clone https://github.com/Nayzow/books-service-backend
```

#### 2. Installation

#### Installation avec Maven

#### 1. À la racine du projet, installez les dépendances en utilisant la commande

```bash
mvn clean install
```

#### 2. Démarrez l'application avec la commande :

```bash
mvn spring-boot:run
```

#### Installation avec Docker

#### 1. Build l'image Docker

```bash
docker build -t books-service-backend .
```

####  2. Run le conteneur Docker

```bash
docker run --name books-service-backend -p 8080:8080 -d books-service-backend
```

### Routes de l'API

```
/books : renvoie touts les comics.
```

```
/books/{id} : renvoie le comic avec un id donné.
```

```
/series : renvoie toutes les séries de comics.
```

```
/series/{id} : renvoie la série de comics avec un id donné.
```

```
/editors : renvoie touts les éditeurs de comics.
```

```
/editors/{id} : renvoie l'éditeur de comics avec un id donné.
```

```
/statements : renvoie les états de touts les comics.
```

```
/statements/{id} : renvoie l'état d'un comics à partir d'un id donné.
```

```
/libraries : renvoie toutes les bibliothèques utilisateur.
```

```
/libraries/{id} : renvoie la bibliothèque utilisateur avec un id donné.
```

```
/users : renvoie touts les utilisateurs.
```

```
/users/{id} : renvoie un utilisateur avec un id donné.
```
