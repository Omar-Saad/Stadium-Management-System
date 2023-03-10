-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;

CREATE TABLE IF NOT EXISTS users
(
    id serial NOT NULL,
    name VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    phone_number VARCHAR(16) NOT NULL UNIQUE,
    profile_picture bytea,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS admins
(
    id integer NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS employee
(
    id integer NOT NULL UNIQUE,
    salary FLOAT NOT NULL,
    ssn VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS stadiums
(
    id serial NOT NULL,
    name VARCHAR(1024) NOT NULL,
    description text NOT NULL,
    size integer NOT NULL,
    cost_per_hour FLOAT NOT NULL,
    location VARCHAR(1024) NOT NULL,
    photo bytea,
    stadium_number integer NOT NULL,
    status VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reservations
(
    id serial NOT NULL,
    customer_id integer NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    stadium_id integer NOT NULL,
    deposit FLOAT NOT NULL,
    total_price FLOAT NOT NULL,
    payment_method VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS customer
(
    id integer NOT NULL,
    balance FLOAT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS admins
    ADD CONSTRAINT admin_id_fk FOREIGN KEY (id)
    REFERENCES users (id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS employee
    ADD CONSTRAINT employee_id_fk FOREIGN KEY (id)
    REFERENCES users (id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS reservations
    ADD CONSTRAINT stadium_id_fk FOREIGN KEY (stadium_id)
    REFERENCES stadiums (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS reservations
    ADD CONSTRAINT customer_id_fk1 FOREIGN KEY (customer_id)
    REFERENCES customer (id) 
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS customer
    ADD CONSTRAINT cutomer_id_fk FOREIGN KEY (id)
    REFERENCES users (id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE;
END;