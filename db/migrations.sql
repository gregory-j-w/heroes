--run this file with psql -a -f db/migrations.sql

CREATE DATABASE super;

\c super;

CREATE TABLE heroes (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255), 
	power VARCHAR(255), 
	secret_ident VARCHAR(255), 
	nemesis VARCHAR(255)
);
