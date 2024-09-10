CREATE SEQUENCE IF NOT EXISTS "uuid-hibernate-generator" INCREMENT BY 50;

CREATE TABLE privileges
(
    id   VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT privileges_pkey PRIMARY KEY (id)
);

CREATE TABLE roles
(
    id   VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (id)
);

CREATE TABLE roles_privileges
(
    role_id      VARCHAR(255) NOT NULL,
    privilege_id VARCHAR(255) NOT NULL,
    CONSTRAINT roles_privileges_pkey PRIMARY KEY (role_id, privilege_id)
);

CREATE TABLE users
(
    id         VARCHAR(255) NOT NULL,
    email      VARCHAR(255),
    password   VARCHAR(255) NOT NULL,
    username   VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    user_id VARCHAR(255) NOT NULL,
    role_id VARCHAR(255) NOT NULL,
    CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id)
);

ALTER TABLE users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);

ALTER TABLE privileges
    ADD CONSTRAINT ukm2tnonbcaquofx1ccy060ejyc UNIQUE (name);

ALTER TABLE roles
    ADD CONSTRAINT ukofx66keruapi6vyqpv6f2or37 UNIQUE (name);

ALTER TABLE users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);

ALTER TABLE users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;

ALTER TABLE roles_privileges
    ADD CONSTRAINT fk5duhoc7rwt8h06avv41o41cfy FOREIGN KEY (privilege_id) REFERENCES privileges (id) ON DELETE NO ACTION;

ALTER TABLE roles_privileges
    ADD CONSTRAINT fk629oqwrudgp5u7tewl07ayugj FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE NO ACTION;

ALTER TABLE users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE NO ACTION;