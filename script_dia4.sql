/*-- importar e exqueceu de colocar o sigas....

--select updategeometrysrid('conservation_units_legal_amazon', 'geom',4674);





-- 1 . select id, jurisd, geom, into icmbio_gr1

from icmbio_gerencia

where jurisd ilike 'GR 1 - NORTE'



-- 2  st_transform > transforma o srid



select a.id, a.classname, a.geom into degradacao_resex

from inpe_deter_utm a, conservation_units_legal_amazon b

where a.classname ilike 'DEGRADACAO' and

b.nome ilike 'Reserva Extrativista Jaci-Paraná' and

st_intersects(st_transform(a.geom,4674), b.geom)



-- 3    retorna 



select st_centroid(a.geom) geom2 --into deter_centroid

from inpe_deter_utm a, conservation_units_legal_amazon b

where b.nome ilike 'Reserva Extrativista Jaci-Paraná' and

st_intersects(st_transform(a.geom,4674), b.geom);

--alterando os campos geom da tabela 

alter table deter_centroid

rename column geom2 to geom;



-- 4 retorna o tipo e o municipio DAS SEDES DOS IBGE E ICMBIO QUE ESTÃO DENTRO DA 'GR 1 - Norte'

select a.base, a.tipo, a.municipio, a.geom

from pontos_grs_sedes_bases a, gerencias_regionais b

where b.jurisd ilike 'GR 1 - Norte' and

st_contains(b.geom, a.geom)

-- 5  - 

select count(a.id)

from embargos_icmbio_atualizado a, gerencias_regionais b

where b.jurisd ilike 'GR 1 - Norte' and

st_intersects(a.geom, b.geom)

-- 6 - 

select a.id, a.geom

from embargos_icmbio_atualizado a, conservation_units_legal_amazon b

where b.nome ilike 'Floresta Nacional do Jamanxim' and

st_intersects(a.geom, b.geom)



select updategeometrysrid('embargos_icmbio_atualizado', 'geom',4674);

*/

--7- selecionei um retangulo e apontei uma br,  e vou pegar todas as estradas que chegam do lado esquerdo

select a.id, a.geom

from trecho_rodoviario_ro a, trecho_rodoviario_ro b

where b.nome ilike 'km 70' and

st_intersects(a.geom, st_setsrid(st_makebox2d(st_point(-62.2996, -9.7022),

st_point(-62.6681, -10.0191)), 4674)) and 

a.geom &< b.geom
