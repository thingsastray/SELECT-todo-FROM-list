
DROP USER IF EXISTS michael;

CREATE USER michael with ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE	todo_app;

CREATE DATABASE todo_app; 

\c todo_app;

-- DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
 id serial not null,
 title char(50) not null,
 description text null,
 created_at timestamp not null DEFAULT now(),
 updated_at timestamp null,
 completed boolean not null DEFAULT false
);

ALTER TABLE IF EXISTS tasks ADD PRIMARY KEY (id);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD completed_at timestamp null DEFAULT null;

ALTER TABLE tasks ALTER updated_at SET not null;

ALTER TABLE tasks ALTER updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study PostgreSQL',
  'Read all the documentation'
);

SELECT title 
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET  completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at desc;

INSERT INTO tasks VALUES (
  DEFAULT,
  'mistake 1',
  'a test entry'
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'mistake 2',
  'another test entry'
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'third mistake',
  'another test entry'
);

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title= 'mistake 1';

SELECT title, description
FROM	tasks
WHERE	title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM title
ORDER BY title asc;

