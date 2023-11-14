-- Таблица пользователей
CREATE TABLE Users (
                       user_id INT PRIMARY KEY,
                       phone_number VARCHAR(20),
                       hashed_password VARCHAR(255),
                       is_subscribed BOOLEAN,
                       subscription_start_date DATE,
                       subscription_expiry_date DATE
);

-- Таблица режиссеров
CREATE TABLE Directors (
                       director_id INT PRIMARY KEY,
                       name VARCHAR(100)
);

-- Таблица сценаристов
CREATE TABLE Writers (
                         writer_id INT PRIMARY KEY,
                         name VARCHAR(100)
);

-- Таблица продюсеров
CREATE TABLE ProductionCompanies (
                         production_company_id INT PRIMARY KEY,
                         name VARCHAR(100)
);

-- Таблица актеров
CREATE TABLE Actors (
                        actor_id INT PRIMARY KEY,
                        name VARCHAR(100)
);

-- Таблица жанров
CREATE TABLE Genres (
                        genre_id INT PRIMARY KEY,
                        name VARCHAR(100)
);

-- Таблица просмотренных фильмов
CREATE TABLE WatchedMovies (
                           user_id INT,
                           movie_id VARCHAR(255), -- MongoDB ID
                           is_favorite BOOLEAN,
                           PRIMARY KEY (user_id, movie_id),
                           FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Таблица «Просмотренные сериалы»
CREATE TABLE WatchedSeries (
                           user_id INT,
                           series_id VARCHAR(255), -- MongoDB ID
                           is_favorite BOOLEAN,
                           PRIMARY KEY (user_id, series_id),
                           FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- Таблица предпочтительных актеров пользователя
CREATE TABLE UserFavoriteActors (
                            user_id INT,
                            actor_id INT,
                            PRIMARY KEY (user_id, actor_id),
                            FOREIGN KEY (user_id) REFERENCES Users(user_id),
                            FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- Таблица предпочитаемых жанров пользователя
CREATE TABLE UserFavoriteGenres (
                            user_id INT,
                            genre_id INT,
                            PRIMARY KEY (user_id, genre_id),
                            FOREIGN KEY (user_id) REFERENCES Users(user_id),
                            FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Таблица предпочитаемых сценаристов пользователя
CREATE TABLE UserFavoriteWriters (
                             user_id INT,
                             writer_id INT,
                             PRIMARY KEY (user_id, writer_id),
                             FOREIGN KEY (user_id) REFERENCES Users(user_id),
                             FOREIGN KEY (writer_id) REFERENCES Writers(writer_id)
);

-- Таблица предпочитаемых режиссеров пользователя
CREATE TABLE UserFavoriteDirectors (
                               user_id INT,
                               director_id INT,
                               PRIMARY KEY (user_id, director_id),
                               FOREIGN KEY (user_id) REFERENCES Users(user_id),
                               FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

-- Таблица предпочтительных съемочных компаний пользователя
CREATE TABLE UserFavoriteProductionCompanies (
                                 user_id INT,
                                 production_company_id INT,
                                 PRIMARY KEY (user_id, production_company_id),
                                 FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                 FOREIGN KEY (production_company_id) REFERENCES ProductionCompanies(production_company_id)
);

-- Таблица рейтингов фильмов пользователя
CREATE TABLE UserMovieRatings (
                                  user_id INT,
                                  movie_id VARCHAR(255), -- MongoDB ID
                                  rating INT,
                                  PRIMARY KEY (user_id, movie_id),
                                  FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                  CHECK (rating BETWEEN 1 AND 10)
);

-- Таблица рейтингов сериалов пользователя
CREATE TABLE UserSeriesRatings (
                                   user_id INT,
                                   series_id VARCHAR(255), -- MongoDB ID
                                   rating INT,
                                   PRIMARY KEY (user_id, series_id),
                                   FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                   CHECK (rating BETWEEN 1 AND 10)
);
