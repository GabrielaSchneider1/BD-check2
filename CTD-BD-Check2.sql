create database doacao;
USE doacao;

CREATE TABLE instituicao (
id_instituicao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_instituicao VARCHAR(45) NOT NULL,
endereco_instituicao VARCHAR(45) NOT NULL,
telefone_instituicao VARCHAR(45) NOT NULL,
whatsapp_instituicao VARCHAR(45),
chave_pix_instituicao VARCHAR(45)
);

CREATE TABLE pedidoDoacao (
id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
status_pedido TINYINT NOT NULL,
fk_instituicao_id INT,
FOREIGN KEY (fk_instituicao_id) REFERENCES instituicao(id_instituicao)
);

CREATE TABLE itemPedido (
id_itemPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descricao_itemPedido VARCHAR(45) NOT NULL,
quantidade_itemPedido INT NOT NULL,
nome_itemPedido VARCHAR(45) NOT NULL,
unidade_itemPedido VARCHAR(45) NOT NULL,
fk_pedidoDoacao_id INT,
FOREIGN KEY (fk_pedidoDoacao_id) REFERENCES pedidoDoacao(id_pedido)
);

INSERT INTO instituicao VALUES (1, 'Casa do idoso', 'Rua das Flores, 78', 'Fone 5130611585', 'Whats 5199741631', 'Chave PIX 5199741631');
INSERT INTO instituicao VALUES (2, 'Pastoral da crianca', 'Avenida do Estado, 102', 'Fone 5132712498', 'Whats 51999552104', 'Chave PIX 51999552104');
INSERT INTO instituicao VALUES (3, 'Abrigo Municipal', 'Rua Principal, 514', 'Fone 5132417546', 'Whats 51984523193', 'Chave PIX 51984523193');
INSERT INTO instituicao VALUES (4, 'Lar dos deficientes', 'Rua Principal, 5200', 'Fone 513336525', 'Whats 51999663355', 'Chave PIX 51999663355');

DELETE FROM instituicao WHERE (nome_instituicao = 'Abrigo Municipal');

UPDATE instituicao SET endereco_instituicao = 'Rua 42, 1001' WHERE endereco_instituicao = 'Rua das Flores, 78'; 

INSERT INTO pedidoDoacao VALUES (1, 2, 4);
INSERT INTO pedidoDoacao VALUES (2, 1, 2);

UPDATE pedidoDoacao SET fk_instituicao_id = 1 WHERE fk_instituicao_id = 4; 

SELECT * from instituicao;
SELECT * from instituicao WHERE (nome_instituicao = 'Pastoral da crianca');
SELECT * from instituicao WHERE (telefone_instituicao = 'Fone 513336525');
SELECT * from pedidoDoacao;
SELECT * from pedidoDoacao WHERE (status_pedido = 2);