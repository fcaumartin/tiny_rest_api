# tiny API Rest

API Rest très simple.

> ATTENTION: Ceci est un projet pédagogique, il n'est pas sécurisé, il donne accès à toute votre base de données.

## Installation

Placer le fichier `index.php` dans le répertoire `api`.

Modifiez les informations de connexion à la base de données

```php
const DATABASE_HOST = "127.0.0.1";
const DATABASE_NAME = "hotel";
const DATABASE_USER = "dbuser";
const DATABASE_PASSWORD = "fakefake";
```


## Utilisation

Un exmeple d'utilisation est dans `test.http`

```http
GET http://127.0.0.1:8000/api/clients
```

```http
GET http://127.0.0.1:8000/api/clients/1
```
```http
POST http://127.0.0.1:8000/api/clients
Content-Type: application/json

{
    "nom": "test1",
    "prenom": "test2",
    "ville": "test34"
}
```
```http
PUT http://127.0.0.1:8000/api/clients/13

{
    "ville": "dd"
}
```

```http
DELETE http://127.0.0.1:8000/api/clients/13
```