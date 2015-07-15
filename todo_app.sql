DROP USER 'michae';
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE todo_app;
CREATE DATABASE todo_app ENCODING 'utf8';
\connect todo_app;

CREATE TABLE tasks(
  id serial NOT NULL,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE tasks DROP COLUMN completed RESTRICT;
ALTER TABLE tasks
  ADD COLUMN completed_at timestamp DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL DEFAULT NOW();
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS null;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description from tasks WHERE completed_at IS null;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake 1%';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY created_at ASC;