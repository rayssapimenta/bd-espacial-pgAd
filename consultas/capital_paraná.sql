--para saber a capital de paraná
select b.nome
from br_uf_2021 a, bcim_capital_ppoint b
where st_contains(a.geom, b.geom) and a.nm_uf like 'Paraná'