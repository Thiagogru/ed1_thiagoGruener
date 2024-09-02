-- 1. Inserir um novo jogo
INSERT INTO public.jogo (nome_jogo, description, price, data_launch, developer)
VALUES ('jogoExemplo', 'Um exemplo de jogo que possui uma descrição mínima de 50 caracteres.', 59.99, '2023-01-01', 'DesenvolvedoraExemplo');

-- 2. Criar nova tag (gênero) e associá-la ao jogo
INSERT INTO public.genero (nome_genero, description_genero)
VALUES ('ação', 'Jogos que envolvem muita ação e aventura.');

INSERT INTO public.jogo_tag (nome_jogo, nome_tag)
VALUES ('jogoExemplo', 'ação');

-- 3. Inserir o novo cliente "Jorge Azevedo"
INSERT INTO public.cliente (id_cliente, cpf, cep, adress_number, nome_cliente, email, data_nasc, telefone, senha)
VALUES (nextval('public.cliente_id_cliente_seq'), '12345678901', '12345678', 100, 'Jorge Azevedo', 'jorge.azevedo@example.com', '1985-07-23', '21987654321', 'senhaSegura123');

-- 4. Criar um carrinho para o cliente
INSERT INTO public.carrinho (id_carrinho, valor_carrinho, id_cliente)
VALUES (nextval('public.carrinho_id_carrinho_seq'), 59.99, currval('public.cliente_id_cliente_seq'));

-- 5. Adicionar o jogo ao carrinho
INSERT INTO public.jogo_no_carrinho (valor_jogo, id_carrinho, nome_jogo)
VALUES (59.99, currval('public.carrinho_id_carrinho_seq'), 'jogoExemplo');

-- 6. Criar uma compra com o carrinho
INSERT INTO public.compra (id_compra, valor_total, status, id_carrinho)
VALUES (nextval('public.compra_id_compra_seq'), 59.99, 'em andamento', currval('public.carrinho_id_carrinho_seq'));

-- 7. Realizar o pagamento da compra
INSERT INTO public.pagamento (numero_pagamento, metodo, nota_fical, valor_final, id_compra)
VALUES (nextval('public.pagamento_numero_pagamento_seq'), 'pix', '12345678901234567890', 59.99, currval('public.compra_id_compra_seq'));

-- 8. Atualizar o status da compra para "pago"
UPDATE public.compra
SET status = 'pago'
WHERE id_compra = currval('public.compra_id_compra_seq');

-- 9. Adicionar o jogo à biblioteca do cliente
INSERT INTO public.cliente_possui (id_cliente, nome_jogo, horas_jogadas)
VALUES (currval('public.cliente_id_cliente_seq'), 'jogoExemplo', 0.00);

-- 10. Alterar a quantidade de horas jogadas
UPDATE public.cliente_possui
SET horas_jogadas = 5.5
WHERE id_cliente = currval('public.cliente_id_cliente_seq')
AND nome_jogo = 'jogoExemplo';

-- 11. Realizar uma avaliação do jogo
INSERT INTO public.cliente_avalia (id_cliente, nome_jogo, nota, review)
VALUES (currval('public.cliente_id_cliente_seq'), 'jogoExemplo', 4, 'Jogo muito bom, mas pode melhorar em alguns aspectos.');
