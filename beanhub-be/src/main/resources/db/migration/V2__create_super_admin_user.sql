CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO roles (id, name)
VALUES (uuid_generate_v4(), 'ROLE_SUPER_ADMIN');

INSERT INTO privileges (id, name)
VALUES
    (uuid_generate_v4(), 'READ_PRIVILEGE'),
    (uuid_generate_v4(), 'WRITE_PRIVILEGE'),
    (uuid_generate_v4(), 'UPDATE_PRIVILEGE'),
    (uuid_generate_v4(), 'DELETE_PRIVILEGE'),
    (uuid_generate_v4(), 'ADMIN_PRIVILEGE');

WITH role_id AS (SELECT id FROM roles WHERE name = 'ROLE_SUPER_ADMIN'),
     privilege_ids AS (SELECT id FROM privileges)
INSERT INTO roles_privileges (role_id, privilege_id)
SELECT role_id.id, privilege_ids.id
FROM role_id, privilege_ids;

INSERT INTO users (id, username, password, email)
VALUES (uuid_generate_v4(), 'superadmin', '{bcrypt}$2a$14$nrstSlnMKifzM89e2ajFk.p7lHp4DtdrQY/K5lmrEYbrp0S81hGBC', 'superadmin@example.com');

WITH user_id AS (SELECT id FROM users WHERE username = 'superadmin'),
     role_id AS (SELECT id FROM roles WHERE name = 'ROLE_SUPER_ADMIN')
INSERT INTO users_roles (user_id, role_id)
SELECT user_id.id, role_id.id
FROM user_id, role_id;