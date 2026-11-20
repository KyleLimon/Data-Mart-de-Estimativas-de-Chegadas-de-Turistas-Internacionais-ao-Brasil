# Data Mart de Estimativas de Chegadas de Turistas Internacionais ao Brasil (2023–2026)

Projeto desenvolvido para a disciplina de **Sistemas de Apoio à Decisão (SAD)** da **Universidade Federal Rural de Pernambuco (UFRPE) — Unidade Acadêmica de Serra Talhada (UAST)**, sob orientação da **Profª Ellen Polliana Ramos Souza Pereira**.

- **Painel OLAP Interativo (Power BI Web):** [Acessar Aplicação OLAP](https://app.powerbi.com/view?r=eyJrljoiNDA1MzgzZmYtNDk3OC00ZWUwLTk4NGQtNGM4Yjg0Y2EzNzFjliwidCI6Ijg5YjY3NmUxLTMwMmEtNDkzYi05ODkzLTc5MjAyOTIyN2IzYSJ9)
- **Fonte Oficial dos Dados:** [Observatório Nacional do Turismo / Ministério do Turismo](https://paineis.turismo.gov.br/extensions/observatorio/turistas.html)

---

## Autores
- **Caio César Lima Diniz** — `caio.cesarlima@ufrpe.br`
- **Emerson Emanuel de Oliveira Lima** — `eemanuel643789@gmail.com`

---

## Arquitetura e Stack Tecnológica
O projeto segue a abordagem dimensional **Bottom-Up (Kimball)** estruturada em **Esquema Estrela (Star Schema)**, consolidando as séries históricas mensais de 2023 a 2026 (acumulado até julho de 2026):

1. **Extração (Arquivos Planos):** Microdados em formato `.csv` (97.159 registros brutos) extraídos do Observatório Nacional do Turismo / Polícia Federal.
2. **ETL (Pentaho Data Integration / Spoon):** Padronização de layout, higienização textual, normalização de modais de acesso, deduplicação e carga idempotente.
3. **Armazenamento (PostgreSQL):** Banco relacional com tabela de staging, 4 dimensões, 1 tabela fato (65.688 linhas / 27.844.137 chegadas consolidadas) e índices B-Tree nas chaves estrangeiras.
4. **Camada Analítica / OLAP (Power BI):** Modelo multidimensional, medidas DAX e Painel de Bordo Executivo publicado na Web.

---

## Estrutura do Repositório

```text
├── dados/      # Arquivos CSV brutos de chegadas internacionais (2023 a 2026)
├── docs/       # Documentação completa do projeto (Etapas 1 a 6 em PDF)
├── etl/        # Transformações (.ktr) do Pentaho Data Integration (PDI)
├── olap/       # Arquivo original do Power BI Desktop (.pbix)
├── sql/        # Scripts DDL de criação das tabelas (01) e índices (02)
└── README.md   # Guia de arquitetura e execução do projeto