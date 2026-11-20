# 📊 Data Mart — Estimativas de Chegadas de Turistas Internacionais ao Brasil (2023–2026)

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Pentaho PDI](https://img.shields.io/badge/Pentaho_PDI-CC0000?style=for-the-badge&logo=hitachi&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![UFRPE / UAST](https://img.shields.io/badge/UFRPE_--_UAST-Sistemas_de_Apoio_à_Decisão-006633?style=for-the-badge)

Solução completa de **Business Intelligence (BI)** e **Data Warehousing** desenvolvida na disciplina de **Sistemas de Apoio à Decisão (SAD)** da **Universidade Federal Rural de Pernambuco (UFRPE) — Unidade Acadêmica de Serra Talhada (UAST)**, sob orientação da **Profª Ellen Polliana Ramos Souza Pereira**.

O projeto consolida e modela os microdados migratórios de fronteira disponibilizados pelo **Ministério do Turismo / Observatório Nacional do Turismo** e pela **Polícia Federal** (série histórica de **2023 a julho de 2026**), transformando arquivos planos brutos em inteligência analítica para apoio à tomada de decisão.

> 🔗 **[Acessar Painel OLAP Interativo (Power BI Web)](https://app.powerbi.com/view?r=eyJrIjoiNDA1MzgzZmYtNDk3OC00ZWUwLTk4NGQtNGM4Yjg0Y2EzNzFjIiwidCI6Ijg5YjY3NmUxLTMwMmEtNDkzYi05ODkzLTc5MjAyOTIyN2IzYSJ9)**  
> 📄 **[Consultar Documentação Completa (Etapas 1 a 6 em PDF)](docs/Data Mart de Estimativas de Chegadas de Turistas Internacionais ao Brasil.pdf)**  
> 🌐 **[Fonte Oficial dos Dados (Observatório Nacional do Turismo)](https://paineis.turismo.gov.br/extensions/observatorio/turistas.html)**

---

## 📌 Contextualização, Escopo e Público-Alvo

O turismo internacional atua como vetor estratégico para a captação de divisas e geração de empregos no Brasil. Como os microdados de fronteira encontram-se dispersos em arquivos anuais heterogêneos, este Data Mart centraliza os registros por ponto de entrada, modal de transporte e país de residência para responder a perguntas estratégicas de negócio:

* **Sazonalidade e Origem:** Quais continentes e países lideram as chegadas nos meses de verão em comparação ao inverno?
* **Concentração por Via de Acesso:** Qual a proporção de turistas que ingressam por via aérea versus terrestre nas fronteiras do Mercosul?
* **Distribuição Geográfica:** Quais Unidades Federativas concentram a maior parte do fluxo receptivo internacional?
* **Tendência e Crescimento Anual:** Qual a taxa de evolução (YoY) do volume de chegadas em relação aos anos anteriores?

### Usuários Beneficiados
* **Setor Público (Ministério do Turismo, Embratur, Secretarias Estaduais):** Planejamento de campanhas de promoção no exterior e dimensionamento de infraestrutura em aeroportos e postos de fronteira.
* **Iniciativa Privada (Companhias Aéreas, Rede Hoteleira, Operadoras):** Ajuste de malha aérea internacional e precificação dinâmica conforme a sazonalidade dos mercados emissores.

---

## 🏗️ Arquitetura Tecnológica e Metodologia

Adotou-se a abordagem **Bottom-Up (Ralph Kimball)** estruturada em **Esquema Estrela (Star Schema)**, priorizando entregas analíticas rápidas, integridade referencial e alta performance de leitura OLAP:

```text
[ CSVs Brutos (2023–2026) ] ──▶ [ Pentaho PDI / Spoon ] ──▶ [ PostgreSQL (Star Schema) ] ──▶ [ Power BI (OLAP / DAX) ]
   Observatório do Turismo         Staging, Limpeza &          Dimensões, Fato &              Medidas, Filtros &
    (97.159 registros)            Carga Idempotente             Índices B-Tree                Painel Executivo
