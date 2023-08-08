/* Database schema to keep the structure of entire database. */

CREATE TABLE music_album(
   ID int GENERATED ALWAYS AS IDENTITY
   GENRE_ID int,
   FOREIGN KEY (GENRE_ID) REFERENCES GENRE(ID)
   AUTHOR_ID int,
   FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(ID)
   LABEL_ID int,
   FOREIGN KEY (LABEL_ID) REFERENCES LABEL(ID)
   PUBLISH_DATE date,
   ON_SPOTIFY varchar(100),
   ARCHIVED boolean,
   PRIMARY KEY(ID)
);

CREATE TABLE book(
   ID int GENERATED ALWAYS AS IDENTITY
   GENRE_ID int,
   FOREIGN KEY (GENRE_ID) REFERENCES GENRE(ID)
   AUTHOR_ID int,
   FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(ID)
   LABEL_ID int,
   FOREIGN KEY (LABEL_ID) REFERENCES LABEL(ID)
   PUBLISH_DATE date,
   PUBLISHER varchar(100),
   COVER_STATE varchar(100),
   ARCHIVED boolean,
   PRIMARY KEY(ID)
);

CREATE TABLE genre(
   ID int GENERATED ALWAYS AS IDENTITY,
   name varchar(100),
   PRIMARY KEY(ID)
);

CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false,
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES author (id),
  source_id INT REFERENCES source (id),
  label_id INT REFERENCES label (id)
);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
)


CREATE TABLE label(
   ID int GENERATED ALWAYS AS IDENTITY,
   TITLE varchar(100),
   COLOR varchar(100),
   PRIMARY KEY(ID)
);

