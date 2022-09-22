--criamos uma 'camada' permanente, levando em consideração que gravamos em uma tabela
select id, jurisd, geom into icmbio_gr1
from gerencias_regionais
where jurisd ilike 'GR 1 - NORTE'

SELECT * from icmbio_gr1