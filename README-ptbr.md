# Dark-Matter 🚀🌌 - Seu Ambiente de Estudos em Dados

Bem-vindo ao **Dark-Matter**, um ecossistema de dados avançado desenvolvido para estudantes e entusiastas de dados explorarem um ambiente completo usando tecnologias modernas em containers. Este projeto de portfólio demonstra as melhores práticas em orquestração, gerenciamento de data lakes e processamento de big data, tudo encapsulado em containers Docker.

[Ver versão em Inglês (EN)](README.md)

---

## 🌟 Sobre o Projeto

**Dark-Matter** combina o poder de:

- **Apache Airflow** 🛠️ para orquestração e gerenciamento de workflows
- **PostgreSQL** 🐘 como banco de metadados
- **Apache Spark + Iceberg** 🔥 para processamento escalável de dados e gerenciamento de data lakes versionados
- **MinIO** 🦁 como armazenamento compatível com S3

Tudo funciona de forma integrada e isolada em containers, proporcionando um ambiente reprodutível, escalável e educativo para estudantes de engenharia de dados e ciência de dados.

---

## 🚀 Recursos e Arquitetura

Este ecossistema inclui:

### 1. **Apache Airflow**
- Orquestra pipelines complexos de dados
- Executa em containers com web server, scheduler e triggerer
- DAGs customizados para orquestrar jobs Spark, ingestão e transformações

### 2. **PostgreSQL**
- Armazena metadados do Airflow e demais componentes
- Dados persistidos com scripts de inicialização

### 3. **Apache Spark + Iceberg**
- Spark configurado com suporte ao formato de tabela **Iceberg** para data lakes escaláveis e versionados
- Imagem Docker baseada na configuração do Databricks
- Capaz de lidar com grandes volumes de dados de forma eficiente

### 4. **Data Lake com MinIO**
- Armazenamento de objetos compatível com S3
- Guarda dados brutos e processados
- Acessível via interface web do MinIO e SDKs

---

## 🛠️ Como Funciona

- Todos os serviços são orquestrados com **Docker Compose**
- O **Makefile** facilita a configuração, inicialização, parada e limpeza do ambiente
- Desenvolvimento de workflows com DAGs no Airflow
- Processamento de dados com Spark + Iceberg, conectado ao MinIO
- Scripts de inicialização do banco configuram o PostgreSQL

---

## 📝 Como Usar

### Pré-requisitos
- Docker e Docker Compose instalados
- Conhecimento básico de ferramentas de engenharia de dados

### Começando

1. Clone o repositório
```bash
git clone https://github.com/edsonlourenco/Dark-Matter.git
cd Dark-Matter
