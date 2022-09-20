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
SELECT sum(contem.quantidade*produto.preco)/(SELECT count(pedido.numero)
											FROM pedido, cliente
											WHERE cliente.nome ilike 'João' and
		   									cliente.cpf = pedido.cpf_cliente )
											FROM pedido, cliente, contem, produto
WHERE cliente.nome ilike 'João' and
		   	cliente.cpf = pedido.cpf_cliente and
		    pedido.numero = contem.numero_pedido and
		   	produto.codigo = contem.codigo_produto


7- Relação nominal dos vendedores cadastrados
select nome
from vendedor
order by nome;
8- Nome e preço dos produtos cadastrados

select descricao nome, preco
from produto
order by descricao
9- Listar clientes por ordem alfabética
select nome 
from cliente
order by nome
10- Verificar quantidade de produtos cadastrados
select count(codigo) as soma
from produto


11- Verificar o CPF dos clientes
select cpf 
from cliente
12- Verificar o CPF dos clientes Pedro
select cpf, nome
from cliente
where nome ilike 'pedro'

13- Qual o nome da loja cujo código é 4?
select nome
from loja
where codigo = 4
14- Quais foram os produtos vendidos no pedido cujo número é 4 

select distinct produto.descricao
from produto, contem, pedido
where contem.codigo_produto = produto.codigo and
contem.numero_pedido = pedido.numero and
pedido.numero = 4


15- Listagem dos clientes que residem em Cacoal

select cliente.nome
from cliente, cidade
where cliente.codigo_cidade = cidade.codigo and 
cidade.nome ilike 'Cacoal'

--select * from cidade, cliente
16- Qual o valor total do pedido numero 8?

select sum(produto.preco * contem.quantidade) as total 
from pedido, produto, contem 
where produto.codigo = contem.codigo_produto and
contem.numero_pedido = pedido.numero and
pedido.numero = 8 

17. Relação de vendedores e respectivas lojas em que estão alocadas



18. Quais foram os clientes atendidos pela vendedora Josefa?



19. Quantidade de vendedores por loja


