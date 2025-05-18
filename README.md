# Dark-Matter 🚀🌌 - Your Data Home Lab for Studies

Welcome to **Dark-Matter**, an advanced data ecosystem project designed for data students and enthusiasts to explore a full-stack environment using modern containerized technologies. This portfolio project showcases best practices in orchestration, data lake management, and big data processing, all encapsulated within Docker containers.

[Ver versão em Português (PT-BR)](README-ptbr.md)

---

## 🌟 About the Project

**Dark-Matter** combines the power of:

- **Apache Airflow** 🛠️ for orchestration and workflow management
- **PostgreSQL** 🐘 as the metadata database
- **Apache Spark + Iceberg** 🔥 for scalable data processing and versioned data lake management
- **MinIO** 🦁 as the S3-compatible data lake storage

Everything runs seamlessly in isolated containers, providing a reproducible, scalable, and educational environment for data engineering and data science students.

## 📝 Requirements 
- Docker

---

## 🚀 Features & Architecture

This Ecosystem includes:

### 1. **Apache Airflow**
- Orchestrates complex data pipelines
- Runs in containers with a web server, scheduler, and triggerer
- Custom DAGs for orchestrating Spark jobs, data ingestion, and transformations

### 2. **PostgreSQL**
- Stores metadata for Airflow and other components
- Persisted data with initialization scripts

### 3. **Apache Spark + Iceberg**
- Spark configured with support for **Iceberg** table format for scalable, versioned data lakes
- Docker image based on Databricks' Spark Docker setup
- Capable of handling large datasets efficiently

### 4. **Data Lake with MinIO**
- S3-compatible object storage
- Stores raw and processed data
- Accessible via MinIO's web interface and SDKs

---

## 🛠️ How It Works

- All services are orchestrated with **Docker Compose**
- The **Makefile** simplifies environment setup, startup, shutdown, and cleanup
- Workflow development is carried out in dedicated DAGs within Airflow
- Data processing leverages Spark with Iceberg support, connected to MinIO for storage
- Database initialization scripts prepare PostgreSQL with required schemas

---

## 📝 Setup & Usage

### Prerequisites
- Docker & Docker Compose installed
- Basic knowledge of data engineering tools

### Getting Started

1. Clone the repository
```bash
git clone https://github.com/edsonlourenco/Dark-Matter.git
cd Dark-Matter
make up
# To stop all services:
make down
# Check the Makefile for more details
