select a.id, a.geom
from bcim_trecho_rodoviario_lline a, br_uf_2021 b
where a.geom && b.geom and b.nm_uf ilike 'paraná'