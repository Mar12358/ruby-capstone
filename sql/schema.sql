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

CREATE TABLE genre(
   ID int GENERATED ALWAYS AS IDENTITY,
   name varchar(100),
   PRIMARY KEY(ID)
);