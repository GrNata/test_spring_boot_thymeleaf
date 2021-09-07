DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 1;

CREATE TABLE users
(
  id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
--   id               INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  username         VARCHAR                 NOT NULL,
  password         VARCHAR                 NOT NULL,
  active           BOOLEAN                 NOT NULL,
  email            VARCHAR                 NOT NULL,
  activation_code            VARCHAR

--   registered       TIMESTAMP DEFAULT now() NOT NULL,
--   enabled          BOOL DEFAULT TRUE       NOT NULL,
--   calories_per_day INTEGER DEFAULT 2000    NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  roles    VARCHAR,
  CONSTRAINT user_roles_idx UNIQUE (user_id, roles),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE message
(
    id              INTEGER PRIMARY KEY  ,
    text VARCHAR    NOT NULL ,
    tag VARCHAR NOT NULL ,
    filename VARCHAR ,
    user_id INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
