{{ config(materialized='table') }}
SELECT
    con.id_concessionarias AS concessionaria_id,
    con.nome_concessionaria AS concessionaria,
    cid.nome_cidade AS cidade,
    est.estado AS estado
FROM {{ ref('stg_concessionarias') }} con 
JOIN {{ ref('stg_cidades') }} cid ON con.id_cidades = cid.id_cidades
JOIN {{ ref('stg_estados') }} est ON cid.id_estados = est.id_estados