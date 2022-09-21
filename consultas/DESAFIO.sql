--Qual(is) o nome do(s) estado(s) cruzado(s) pela rodovia BR-280

SELECT distinct a.id, a.geom
FROM bcim_trecho_rodoviario_lline a, br_uf_2021 b
WHERE st_intersects(a.geom, b.geom) and
codtrechor ilike 'BR-280';

/*Quais são as entradas em que as condições de tráfego são desconhecidas?
Visualize no QGIS...(trafego)*/