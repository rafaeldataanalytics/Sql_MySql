# 📊 SQL Queries -- MySQL

Projeto com exemplos práticos de consultas SQL utilizando MySQL.
O objetivo é demonstrar operações fundamentais como seleção de dados,
filtros, agregações, JOINs e ordenação.

Este repositório é focado em prática de banco de dados para
desenvolvimento Back-End e análise de dados.

---

## 🗂 Estrutura do Projeto

O projeto considera duas tabelas:

- `Tabela1`
- `Tabela2`

Ambas possuem a coluna `ColunaId` como chave de relacionamento.

---

## 🧱 Estrutura Exemplo das Tabelas

```sql
CREATE TABLE Tabela1 (
    ColunaId INT,
    ColunaName VARCHAR(100)
);

CREATE TABLE Tabela2 (
    ColunaId INT,
    ColunaName VARCHAR(100)
);
```

---

# 🔎 Consultas Básicas

## 1️⃣ Selecionar todos os registros

```sql
SELECT *
FROM Tabela1 t;
```

Retorna todos os registros da tabela.

---

## 2️⃣ Contar total de registros

```sql
SELECT COUNT(*) AS records
FROM Tabela1 t;
```

Utiliza função de agregação `COUNT()` para contabilizar registros.

---

## 3️⃣ Filtrar valores não nulos

```sql
SELECT
    t.ColunaId,
    t.ColunaName
FROM Tabela1 t
WHERE t.ColunaName IS NOT NULL;
```

Filtra apenas registros onde `ColunaName` possui valor.

---

## 4️⃣ Selecionar dados da segunda tabela

```sql
SELECT *
FROM Tabela2 t2;
```

---

# 🔗 JOIN + Agregação

## 5️⃣ Unir tabelas e contar registros por grupo

```sql
SELECT
    t2.ColunaId,
    t2.ColunaName,
    COUNT(*) AS quantidade
FROM Tabela1 t
INNER JOIN Tabela2 t2
    ON t.ColunaId = t2.ColunaId
GROUP BY
    t2.ColunaId,
    t2.ColunaName;
```

### 🔍 O que essa query faz:

- Realiza um `INNER JOIN`
- Agrupa por `ColunaId` e `ColunaName`
- Conta a quantidade de registros por grupo

---

## 6️⃣ Retornar os 5 menores resultados

```sql
SELECT
    t2.ColunaId,
    t2.ColunaName,
    COUNT(*) AS quantidade
FROM Tabela1 t
INNER JOIN Tabela2 t2
    ON t.ColunaId = t2.ColunaId
GROUP BY
    t2.ColunaId,
    t2.ColunaName
ORDER BY
    quantidade ASC
LIMIT 5;
```

### 🔍 Diferença nesta consulta:

- `ORDER BY quantidade ASC` → ordena do menor para o maior
- `LIMIT 5` → retorna apenas os 5 primeiros registros

---

# 🧠 Conceitos Demonstrados

- SELECT
- WHERE
- IS NOT NULL
- COUNT()
- INNER JOIN
- GROUP BY
- ORDER BY
- LIMIT
- Alias de tabelas
- Funções de agregação

---

# ⚙️ Como Executar

1. Instale o MySQL Server.
2. Crie um banco de dados:

```sql
CREATE DATABASE exemplo_db;
USE exemplo_db;
```

3. Crie as tabelas.
4. Execute as queries no MySQL Workbench ou terminal.

---

# 🚀 Melhorias Futuras

- Adicionar dados fictícios para testes
- Implementar índices
- Testar performance com EXPLAIN
- Criar exemplos com:
  - LEFT JOIN
  - Subqueries
  - CASE
  - Views
  - Procedures

---

# 🎯 Objetivo de Aprendizado

Este projeto reforça fundamentos essenciais para:

- Desenvolvimento Back-End
- Modelagem de dados
- Construção de APIs
- Análise de dados
- Preparação para entrevistas técnicas
