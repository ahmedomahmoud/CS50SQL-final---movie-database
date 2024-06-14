-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--  to search for the film using the film ID ex the imitation game
SELECT * FROM "films" Where "name" = 'The imitation game';

-- to add new user to the users
INSERT INTO users (username, email, password)
VALUES ('alice', 'alice@example.com', 'password123');

-- to show watch list that I created view for
SELECT * FROM "user_watchlist" WHERE "username" ='alice';

-- to show watched list that I created view for
SELECT * FROM "user_watchedlist" WHERE "username"='alice';

-- to insert a movie into watch list
INSERT INTO "watch" ("user_id", "film_id")
VALUES (
    (SELECT "id" FROM "users" WHERE "username" = 'alice'),
    (SELECT "id" FROM "films" WHERE "name" = 'Avatar')
);

-- to insert a movie into watched list
INSERT INTO "watched" ("user_id", "film_id")
VALUES (
    (SELECT "id" FROM "users" WHERE "username" = 'alice'),
    (SELECT "id" FROM "films" WHERE "name" = 'the imitation game')
);
