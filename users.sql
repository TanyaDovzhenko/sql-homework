/* 1. Створити таблицю юзера (id, email, name).*/
START TRANSACTION;
CREATE TABLE users (
    id serial PRIMARY KEY,
    email varchar(100) NOT NULL,
    name varchar(100) NOT NULL
);
COMMIT;


/* 2. Додати до таблиці юзера поле role яке 
буде приймати тільки два значення admin i customer.*/
START TRANSACTION;
CREATE TYPE user_roles AS ENUM('admin', 'customer');
ALTER TABLE users ADD COLUMN role user_roles;
UPDATE users SET role = 'customer';
ALTER TABLE users ALTER COLUMN role SET NOT NULL;
COMMIT;


/* 3. Створити нову таблицю профайлу і зв’язати 
її з юзером через зовнішній ключ (info). */
START TRANSACTION;
CREATE TABLE profile (
    id serial PRIMARY KEY,
    info INTEGER REFERENCES users (id)
);
COMMIT;


/* 4. Змінити для поля role можливі значення до customer. */
START TRANSACTION;
CREATE TYPE user_roles_v2 AS ENUM('customer');
UPDATE users SET role = 'customer' WHERE role = 'admin';
ALTER TABLE users ALTER COLUMN role TYPE user_roles_v2 
USING role::text::user_roles_v2;
DROP TYPE user_roles;
COMMIT;