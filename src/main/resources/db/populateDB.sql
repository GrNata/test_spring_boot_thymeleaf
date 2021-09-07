DELETE FROM user_roles;
DELETE FROM message;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 1;

INSERT INTO users (username, password, email, active) VALUES
('UserAdmin', 'password', 'user@yandex.ru', true),
('Admin', 'admin', 'admin@gmail.com', true),
('Nata', 'nata', 'nata@gmail.com', true);

INSERT INTO user_roles (roles, user_id) VALUES
('ROLE_USER', 1),
('ROLE_ADMIN', 1),
('ROLE_ADMIN', 2),
('ROLE_USER', 3);

INSERT INTO message (id, text, tag, user_id) VALUES
(1, 'message-1', '1', 1),
(2, 'message-2', '2', 2),
(3, 'message-3', '3', 3);