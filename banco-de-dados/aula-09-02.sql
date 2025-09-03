CREATE DATABASE livraria;

USE livraria;

CREATE TABLE editora (
    code INT NOT NULL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
)

CREATE TABLE book (
    code INT NOT NULL PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    editora_code INT NOT NULL,
    
    FOREIGN KEY(editora_code) REFERENCES editora(code)
)