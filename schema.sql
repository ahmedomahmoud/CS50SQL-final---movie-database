CREATE TABLE "users" (
    "id" INTEGER ,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE "films" (
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    "year" NUMERIC NOT NULL,
    "run_time" INTEGER,
    "rating" REAL ,
    "image" BLOB ,
    PRIMARY KEY ("id")
);


CREATE TABLE "stars" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE "directors" (
    "id" INTEGER ,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE "watch" (
    "user_id" INTEGER,
    "film_id" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("film_id") REFERENCES "films" ("id")
);


CREATE TABLE "watched" (
    "user_id" INTEGER,
    "film_id" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("film_id") REFERENCES "films" ("id")
);


CREATE TABLE "acted_in" (
    "star_id" INTEGER,
    "film_id" INTEGER,
    FOREIGN KEY ("star_id") REFERENCES "stars" ("id"),
    FOREIGN KEY ("film_id") REFERENCES "films" ("id")
);


CREATE TABLE "directed" (
    "director_id" INTEGER,
    "film_id" INTEGER,
    FOREIGN KEY ("director_id") REFERENCES "directors" ("id"),
    FOREIGN KEY ("film_id") REFERENCES "films" ("id")
);


CREATE TABLE "genres" (
    "film_id" INTEGER,
    "genre" TEXT NOT NULL,
    FOREIGN KEY ("film_id") REFERENCES "films" ("id")
);

-- there is many search operations by film name so it is important to index it
CREATE INDEX "idx_film_name" ON "films" ("name");

-- There will be many filter operation done by the username to get the watch and watched list so it is better to index it
CREATE INDEX "idx_username" ON "users" ("username");

-- Create a parameterized view to show user's watchlist
CREATE VIEW "user_watchlist" AS
SELECT "users"."username", "films"."name"
FROM "users"
JOIN "watch"  ON "users"."id" = "watch"."user_id"
JOIN "films"  ON "watch"."film_id" = "films"."id"
;

-- Create a  view to show user's watched films
CREATE VIEW "user_watchedlist" AS
SELECT "users"."username", "films"."name"
FROM "users"
JOIN "watched"  ON "users"."id" = "watched"."user_id"
JOIN "films"  ON "watched"."film_id" = "films"."id"
;
