CREATE TABLE IF NOT EXISTS startup (
    id_startup INT AUTO_INCREMENT PRIMARY KEY,
    nome_startup VARCHAR(255),
    cidade_sede VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS linguagem_programacao (
    id_linguagem INT AUTO_INCREMENT PRIMARY KEY,
    nome_linguagem VARCHAR(50),
    ano_lancamento INT
);
CREATE TABLE IF NOT EXISTS programador (
    id_programador INT AUTO_INCREMENT PRIMARY KEY,
    id_startup INT,
    FOREIGN KEY (id_startup) REFERENCES startup(id_startup) ON UPDATE CASCADE,
    nome_programador VARCHAR(255),
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS programador_linguagem (
    id_programador INT,
    id_linguagem INT,
    FOREIGN KEY (id_programador) REFERENCES programador(id_programador) ON DELETE CASCADE,
    FOREIGN KEY (id_linguagem) REFERENCES linguagem_programacao(id_linguagem)
);

ALTER TABLE startup AUTO_INCREMENT = 10001;
ALTER TABLE linguagem_programacao AUTO_INCREMENT = 20001;
ALTER TABLE programador AUTO_INCREMENT = 30001;

INSERT INTO startup (nome_startup, cidade_sede) 
VALUES ('Tech4Toy','Porto Alegre'),
        ('Smart123','Belo Horizonte'),
        ('knowledgeUp','Rio de Janeiro'),
        ('BSI Next Level','Recife'),
        ('QualiHealth','São Paulo'),
        ('ProEdu','Florianópolis');

INSERT INTO linguagem_programacao (nome_linguagem, ano_lancamento) 
VALUES ('Python',1991),
        ('PHP',1995),
        ('Java',1995),
        ('C',1972),
        ('JavaScript',1995),
        ('Dart',2011);

INSERT INTO programador (id_startup, nome_programador, genero, data_nascimento, email) 
VALUES (10001,'João Pedro', 'M', '1993-06-26','joaop@mail.com'),
        (10002,'Paula Silva', 'F', '1986-01-10','paulas@mail.com'),
        (10003,'Renata Vieira', 'F', '1991-07-05','renatav@mail.com'),
        (10004,'Felipe Santos', 'M', '1976-11-25','felipes@mail.com'),
        (10001,'Ana Cristina', 'F', '1968-02-19','anac@mail.com'),
        (10004,'Alexandre Alves', 'M', '1988-07-07','alexandrea@mail.com'),
        (10002,'Laura Marques', 'F', '1987-10-04','lauram@mail.com');

INSERT INTO programador_linguagem (id_programador, id_linguagem) 
VALUES (30001,20001),
       (30001,20002),
       (30002,20003),
       (30003,20004),
       (30003,20005),
       (30004,20005),
       (30007,20001),
       (30007,20002);