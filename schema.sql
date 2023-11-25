CREATE TABLE "label" (
  "id" int PRIMARY KEY,
  "title" varchar(255),
  "color" varchar(255)
);

CREATE TABLE "genre" (
  "id" int PRIMARY KEY,
  "name" varchar(255)
);

CREATE TABLE "author" (
  "id" int PRIMARY KEY,
  "first_name" varchar(255),
  "last_name" varchar(255)
);

CREATE TABLE "source" (
  "id" int PRIMARY KEY,
  "name" varchar(255)
);

CREATE TABLE "item" (
  "id" int PRIMARY KEY,
  "author_id" int,
  "genre_id" int,
  "source_id" int,
  "label_id" int,
  "publish_date" date,
  "archived" boolean,
  
  FOREIGN KEY ("author_id") REFERENCES "author" ("id"),
  FOREIGN KEY ("genre_id") REFERENCES "genre" ("id"),
  FOREIGN KEY ("source_id") REFERENCES "source" ("id"),
  FOREIGN KEY ("label_id") REFERENCES "label" ("id")
);

CREATE TABLE "book" (
  "id" int PRIMARY KEY,
  "publisher" varchar(255),
  "cover_state" varchar(255),
  FOREIGN KEY ("id") REFERENCES "item" ("id")
);

CREATE TABLE "music_album" (
  "id" int PRIMARY KEY,
  "on_spotify" boolean,
  FOREIGN KEY ("id") REFERENCES "item" ("id")
);

CREATE TABLE "movie" (
  "id" int PRIMARY KEY,
  "silent" boolean,
  FOREIGN KEY ("id") REFERENCES "item" ("id")
);

CREATE TABLE "game" (
  "id" int PRIMARY KEY,
  "multiplayer" boolean,
  "last_played_at" date,
  FOREIGN KEY ("id") REFERENCES "item" ("id")
);
