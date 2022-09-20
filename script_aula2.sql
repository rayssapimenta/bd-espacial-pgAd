/*AULA 2 */

1- Qual o nome das lojas localizadas em Porto Velho?

select loja.nome
from loja, cidade
where cidade.codigo = loja.codigo_cidade and
cidade.nome ilike 'porto velho';
2- Quantos pedidos foram realizados pelo cliente João?

select cliente.nome
from cliente, pedido
where cliente.nome ilike 'joão' and cliente.cpf = pedido.cpf_cliente

select count(pedido.numero)
from pedido, cliente
where cliente.cpf = pedido.cpf_cliente and
cliente.nome ilike 'João'


select * from pedido

3- Quais foram os clientes que realizaram pedidos nos meses de janeiro e fevereiro de 2012?
select cliente.nome, pedido.data
from cliente, pedido
where cliente.cpf = pedido.cpf_cliente and
data between '2012-01-01' and '2012-02-29'

4- Quais foram os produtos que realizaram pedidos nos meses de janeiro e fevereiro de 2012?

select produto.descricao, pedido.data
from pedido, produto, contem
where contem.numero_pedido = pedido.numero and
contem.codigo_produto = produto.codigo and
--pedido.numero = produto.codigo and
data between '2012-01-01' and '2012-02-29'

5- Quais foram os produtos comprados pelo cliente João?

select distinct produto.descricao
from produto, cliente, pedido, contem
where produto.codigo = contem.codigo_produto and
cliente.cpf = pedido.cpf_cliente and
pedido.numero = contem.numero_pedido and
cliente.nome ilike 'joão' and
data between '2012-01-01' and '2012-02-02'


6- Qual a media dos valores dos pedidos feitos pelo cliente João?

