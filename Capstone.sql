CREATE DATABASE CelebritieS;
USE Celebrities;

-- People Table
CREATE TABLE People (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10)
);

-- Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    genre VARCHAR(50)
);

-- Music Table
CREATE TABLE Music (
    music_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    genre VARCHAR(50)
);

-- Contributions Table
CREATE TABLE Contributions (
    contribution_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    movie_id INT,
    music_id INT,
    role VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES People(person_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (music_id) REFERENCES Music(music_id)
);

-- Awards Table
CREATE TABLE Awards (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    award_name VARCHAR(100) NOT NULL,
    year_won INT,
    FOREIGN KEY (person_id) REFERENCES People(person_id)
);

INSERT INTO People (name, nationality, date_of_birth, gender) VALUES
('Wizkid', 'Nigeria', '1990-07-16', 'Male'),
('Burna Boy', 'Nigeria', '1991-07-02', 'Male'),
('Yvonne Nelson', 'Ghana', '1985-11-12', 'Female'),
('Shatta Wale', 'Ghana', '1984-10-17', 'Male'),
('Geneviève Nnaji', 'Nigeria', '1979-05-03', 'Female'),
('Davido', 'Nigeria', '1992-11-21', 'Male'),
('Nana Ama McBrown', 'Ghana', '1977-08-15', 'Female'),
('John Dumelo', 'Ghana', '1984-02-03', 'Male'),
('Tiwa Savage', 'Nigeria', '1980-02-05', 'Female'),
('Majid Michel', 'Ghana', '1980-09-22', 'Male');

SELECT *
FROM people;

INSERT INTO Movies (title, release_year, genre) VALUES
('Lionheart', 2018, 'Drama'),
('The Perfect Picture', 2009, 'Romance'),
('A Trip to Jamaica', 2016, 'Comedy'),
('The Wedding Party', 2016, 'Comedy'),
('4th Republic', 2019, 'Thriller'),
('Beast of No Nation', 2015, 'War'),
('Sugar Rush', 2019, 'Comedy'),
('Chief Daddy', 2018, 'Comedy'),
('Living in Bondage', 2019, 'Drama'),
('The Ghost and the Tout', 2018, 'Comedy');

SELECT *
From Movies;

INSERT INTO Music (title, release_year, genre) VALUES
('Made in Lagos', 2020, 'Afrobeats'),
('African Giant', 2019, 'Afrobeats'),
('Rise', 2019, 'Afrobeats'),
('Timeless', 2023, 'Afrobeats'),
('Omo Baba Olowo', 2012, 'Afrobeats'),
('Reign', 2018, 'Dancehall'),
('Celia', 2020, 'Afrobeats'),
('Sugar Rush', 2019, 'Afrobeats'),
('A Better Time', 2020, 'Afrobeats'),
('Mr Money', 2018, 'Afrobeats');

Select *
from music;

INSERT INTO Contributions (person_id, movie_id, music_id, role) VALUES
(1, NULL, 1, 'Singer'),
(2, NULL, 2, 'Singer'),
(3, 2, NULL, 'Actress'),
(4, NULL, 6, 'Singer'),
(5, 1, NULL, 'Actress'),
(6, NULL, 5, 'Singer'),
(7, 3, NULL, 'Actress'),
(8, 4, NULL, 'Actor'),
(9, NULL, 7, 'Singer'),
(10, 5, NULL, 'Actor');
SELECT *
from Contributions;

INSERT INTO Awards (person_id, award_name, year_won) VALUES
(1, 'Grammy Award', 2021),
(2, 'BET Award', 2020),
(3, 'Africa Movie Academy Award', 2010),
(4, 'Ghana Music Award', 2019),
(5, 'Africa Magic Viewers Choice Award', 2019),
(6, 'MTV Europe Music Award', 2017),
(7, 'Ghana Movie Award', 2018),
(8, 'Africa Magic Viewers Choice Award', 2017),
(9, 'MTV Africa Music Award', 2018),
(10, 'Africa Movie Academy Award', 2012);
SELECT*
from Awards;


###########ALL actors who are also singers 
SELECT p.name
FROM People p
JOIN Contributions c ON p.person_id = c.person_id
WHERE c.movie_id IS NOT NULL AND c.music_id IS NOT NULL;

######## find all movies released in 2019 an their associated actors and actresses 
SELECT m.title, p.name
FROM Movies m
JOIN Contributions c ON m.movie_id = c.movie_id
JOIN People p ON c.person_id = p.person_id
WHERE m.release_year = 2019;

###### List all singers from Nigeria who has won awards 
SELECT p.name, a.award_name, a.year_won
FROM People p
JOIN Awards a ON p.person_id = a.person_id
JOIN Contributions c ON p.person_id = c.person_id
WHERE p.nationality = 'Nigeria' AND c.music_id IS NOT NULL;

###### Count the number of awards won by each person
SELECT p.name, COUNT(a.award_id) AS award_count
FROM People p
LEFT JOIN Awards a ON p.person_id = a.person_id
GROUP BY p.name
ORDER BY award_count DESC;

####### Find all people who have contributed to both movies and music
SELECT p.name
FROM People p
WHERE p.person_id IN (
    SELECT c.person_id
    FROM Contributions c
    WHERE c.movie_id IS NOT NULL
    UNION
    SELECT c.person_id
    FROM Contributions c
    WHERE c.music_id IS NOT NULL
);