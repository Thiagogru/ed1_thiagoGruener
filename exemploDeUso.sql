-- Adicionando um novo jogo
INSERT INTO Jogo (nome_jogo, description, price, data_launch, developer)
VALUES ('jogo1', 'Um jogo de ação em que coisas ocorrem muito interessante legal top', 100.00, '2024-09-1', 'DevDeveloper');

-- Associando o jogo a uma tag (gênero)
INSERT INTO Jogo_tag (nome_jogo, nome_tag)
VALUES ('jogo1', 'Ação');

-- Adicionando um novo cliente
INSERT INTO Cliente (id_cliente, nome_cliente, cpf, email, senha, cep, adress_number, data_nasc, telefone)
VALUES (99, 'João da Silva', '12345678901', 'joao.silva@email.com', 'senha123', '12345678', 10, '1990-05-15', '11987654321');

-- Criando um novo carrinho para o cliente (se ainda não existir)
INSERT INTO Carrinho (id_carrinho)
VALUES (1);

INSERT INTO carrinho_do_cliente (id_carrinho, id_cliente)
VALUES (1, 1);

-- Adicionando o jogo ao carrinho do cliente
INSERT INTO jogo_no_carrinho (id_carrinho, nome_jogo, valor_jogo)
VALUES 	(1, 'jogo1', 
        (SELECT price FROM Jogo WHERE nome_jogo = 'jogo1'));

-- Criando uma nova compra associada ao carrinho
INSERT INTO Compra (id_compra, valor_total, status)
VALUES (1, 100.00, 'Pendente');

-- Realizando o pagamento da compra
INSERT INTO Pagamento (numero_pagamento, metodo, valor_final, nota_fiscal)
VALUES (1, 'credito', 100.00,
		123456789);

-- Atualizando o status da compra para 'Pago'
UPDATE Compra
SET status = 'Pago'
WHERE id_compra = 1;

-- Adicionando o jogo à biblioteca do cliente
INSERT INTO cliente_possui (id_cliente, nome_jogo, horas_jogadas)
VALUES (99, 'jogo1', 0);

-- Atualizando a quantidade de horas jogadas para o cliente
UPDATE cliente_possui
SET horas_jogadas = 5
WHERE id_cliente = 99
  AND nome_jogo = 'jogo1';

-- Adicionando uma review do cliente para o jogo
INSERT INTO cliente_avalia (id_cliente, nome_jogo, nota, review)
VALUES (99, 'jogo1', 5, 'Jogo ok');

