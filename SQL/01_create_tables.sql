-- 1. Tabela de Staging (cole abaixo o CREATE TABLE extraído do seu pgAdmin 4)
-- CREATE TABLE staging_turistas_internacionais ( ... );

-- 2. Tabelas de Dimensão
CREATE TABLE dim_pais_origem (
    id_pais_origem SERIAL PRIMARY KEY,
    pais_origem VARCHAR(100) NOT NULL,
    continente VARCHAR(100)
);

CREATE TABLE dim_uf_destino (
    id_uf_destino SERIAL PRIMARY KEY,
    uf_destino VARCHAR(100) NOT NULL
);

CREATE TABLE dim_via_acesso (
    id_via_acesso SERIAL PRIMARY KEY,
    descricao_via VARCHAR(100) NOT NULL
);

CREATE TABLE dim_tempo (
    id_tempo SERIAL PRIMARY KEY,
    data_completa DATE,
    ano INTEGER NOT NULL,
    mes VARCHAR(50) NOT NULL,
    num_mes INTEGER NOT NULL,
    dia INTEGER
);

-- 3. Tabela Fato
CREATE TABLE fato_chegadas (
    id_pais_origem INTEGER REFERENCES dim_pais_origem(id_pais_origem),
    id_uf_destino INTEGER REFERENCES dim_uf_destino(id_uf_destino),
    id_via_acesso INTEGER REFERENCES dim_via_acesso(id_via_acesso),
    id_tempo INTEGER REFERENCES dim_tempo(id_tempo),
    quantidade_chegadas INTEGER
);