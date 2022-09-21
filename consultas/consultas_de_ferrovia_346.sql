select a.id, a.nome, a.geom
	from bcim_trecho_ferroviario_lline a, bcim_trecho_ferroviario_lline b
		where st_intersects(a.geom, b.geom) 
		and b.id = 346 and a.id <> 346;