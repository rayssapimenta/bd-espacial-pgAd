 --1  Listar numeros e valor total dos pedidos feitos pelo cliente joão
 select vendedor.nome
 from vendedor, loja, cidade, alocacao
 where cidade.nome like 'Porto Velho' and
 vendedor.cpf = alocacao.cpf_vendedor and
 loja.codigo = alocacao.codigo_loja and
 loja.codigo_cidade = cidade.codigo;
 /*  pedido contem produto cliente, mais de uma tabela > junção*/
 
 
 
select pedido.numero, sum(produto.preco * contem.quantidade) as total
from pedido, cliente, contem, produto
where cliente.cpf = pedido.cpf_cliente and
pedido.numero = contem.numero_pedido and
produto.codigo = contem.codigo_produto and
cliente.nome ilike 'João'
group by pedido.numero;

/*
2- Listar os nomes dos vendedores alocados nas lojas da cidade de Porto Velho
*/


select vendedor.nome
from vendedor, cidade, loja, alocacao
where vendedor.cpf = alocacao.cpf_vendedor and
loja.codigo = alocacao.codigo_loja and
cidade.codigo = loja.codigo_cidade and
cidade.nome ilike 'Porto Velho'