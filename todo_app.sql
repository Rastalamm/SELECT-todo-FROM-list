DELETE FROM pg_user WHERE usename = 'michael';
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE todo_app;
CREATE DATABASE todo_app ENCODING 'utf8';
\connect {todo_app | conninfo};

CREATE TABLE tasks(
  id serial NOT NULL,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT NULL
  PRIMARY KEY (id)
);

ALTER TABLE tasks DROP COLUMN completed RESTRICT;




ALTER DATABASE todo_app OWNER TO michael ENCODING 'utf8';

