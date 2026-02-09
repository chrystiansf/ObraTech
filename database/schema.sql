-- Schema for PostgreSQL database for ObraTech

CREATE TABLE IF NOT EXISTS obras (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE IF NOT EXISTS fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    endereco TEXT
);

CREATE TABLE IF NOT EXISTS funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS folha_pagamento (
    id SERIAL PRIMARY KEY,
    funcionario_id INT REFERENCES funcionarios(id),
    mes DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS contas_pagar (
    id SERIAL PRIMARY KEY,
    fornecedor_id INT REFERENCES fornecedores(id),
    valor DECIMAL(10, 2) NOT NULL,
    data_vencimento DATE,
    pago BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS relatorios_diarios (
    id SERIAL PRIMARY KEY,
    obra_id INT REFERENCES obras(id),
    data DATE NOT NULL,
    relatorio TEXT
);