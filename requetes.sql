-- 1]
-- -Sélectionnez tous les champs des films sortis après 1960.
-- -Sélectionnez le titre des films sortis avant 1960.

SELECT * from film WHERE date_sortie > '1960-12-31';
SELECT titre from film WHERE date_sortie < '1960-01-01';


-- 2]
-- -Changez la description du film dont l'ID est 35

UPDATE film
SET `description` = 'Film révolutionnaire'
WHERE `id` = 35;

-- 3]
-- -Insérez un nouveau film - Qu'il soit rattaché à au moins trois catégories. Donnez les requêtes SQL utilisées.

INSERT INTO film (`titre`, `slug`, `image`, `prix`, `description`, `date_sortie`) VALUES
('Alien', 'alien', 'assets/img/alien.jpg', '15', 'Un équipage de vaisseau spatial commercial reçoit un étrange signal de détresse...', '1979-09-12');

INSERT INTO films_categs (`id_film`, `id_categorie`) VALUES
(44, 49),
(44, 51),
(44, 52);

-- 4]
-- -récupérez dans la même requête tous les commentaires du film dont l'ID est 43,
--  tous les champs du film 43, et tous les champs des utilisateurs ayant mis ces commentaires

SELECT C.commentaire, F.*, U.* from commentaire as C
INNER JOIN film as F ON F.id = C.id_film
INNER JOIN user as U ON U.id = C.id_user
WHERE F.id = 43;

-- 5]
-- -Supprimez le film dont le slug commence par "t"

DELETE FROM film
WHERE slug LIKE 't%';

-- 6]
-- -Récupérez tous les champs des utilisateurs qui ont mis des commentaires. Il ne doit pas avoir de doublons -
--  un même utilisateur ne doit apparaître qu'une seule fois

SELECT DISTINCT U.* from user as U
INNER JOIN commentaire as C on U.id = C.id_user;

-- 7]
-- -Récupérez tous les films de la catégorie dont l'ID est 51

SELECT f.titre from film as f
INNER JOIN films_categs as fc ON fc.id_film = f.id
INNER JOIN categorie as c ON fc.id_categorie = c.id
WHERE c.id = 51;

-- 8]
-- -faites la moyenne des notes des films du site

SELECT AVG(note) from commentaire;

-- 9]
-- -Récupérez tous les films sortis au mois de juin

SELECT film.titre from film
WHERE MONTH(date_sortie) = 06;

-- 10]
-- -Récupérez tous les utilisateurs dont le role est user et qui ont postés des commentaires.
--  Il ne doit pas y avoir de doublon.

SELECT DISTINCT U.* from user as U
INNER JOIN commentaire as C on U.id = C.id_user
WHERE U.role = 1;