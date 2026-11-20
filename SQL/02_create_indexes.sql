CREATE INDEX idx_fato_pais ON fato_chegadas(id_pais_origem);
CREATE INDEX idx_fato_uf ON fato_chegadas(id_uf_destino);
CREATE INDEX idx_fato_via ON fato_chegadas(id_via_acesso);
CREATE INDEX idx_fato_tempo ON fato_chegadas(id_tempo);