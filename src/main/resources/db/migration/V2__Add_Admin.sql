insert into users(id, username, password, active)
values (1, 'Admin', 'admin', true );

insert  into user_roles(user_id, roles)
values
    (1, 'ROLE_USER'),
    (1, 'ROLE_ADMIN');