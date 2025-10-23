Nuxeo 10.10 Docker Setup


A Docker-based setup for running Nuxeo 10.10 platform with supporting services including Kafka, Elasticsearch, and MongoDB.
Overview
This project provides a containerized environment for Nuxeo 10.10 with all necessary infrastructure components. It uses Docker Compose to orchestrate multiple services and includes custom Nuxeo packages.
Tech Stack

Nuxeo: 10.10 (Java 11)
Java: Version 11 (required for Nuxeo 10.10 compatibility)
MongoDB: 4.0.18 (document storage)
Elasticsearch: 6.5.3 (search and indexing)
Kafka: 7.5.0 (event streaming)
Zookeeper: 7.5.0 (Kafka coordination)
Docker: Container orchestration

Architecture
The application consists of the following containerized services:

Nuxeo: Main application server (port 8091)
MongoDB: Document database (port 27017)
Elasticsearch: Search engine (port 9200)
Kafka: Message broker (ports 9092, 29092)
Zookeeper: Kafka coordination service (port 2181)
Kafka UI: Kafka monitoring interface (port 8090)
Mongo Express: MongoDB admin interface (port 8082)

Prerequisites

Docker (20.10 or later)
Docker Compose (1.29 or later)
Nuxeo CLID (already configured in docker-compose.yml)
.
├── Dockerfile                 # Custom Nuxeo image configuration
├── docker-compose.yml         # Service orchestration
├── nuxeo.conf                 # Nuxeo configuration file
├── packages/                  # Custom Nuxeo packages (.zip files)
├── logs/                      # Nuxeo application logs
└── src/main/java/com/astro/  # Custom Java code
Installation & Setup
1. Clone the Repository
git clone https://github.com/charul1811/2025-test.git
cd 2025-test
2. Add Custom Packages
  mkdir -p packages
# Copy your package files to packages/
3. Build and Start Services
docker-compose up -d
This will:

Build the custom Nuxeo Docker image
Start all required services
Create necessary volumes for data persistence
4. Verify Services
docker-compose ps
Accessing the Application

Nuxeo Platform: http://localhost:8091/nuxeo

Default credentials: Administrator / Administrator


Kafka UI: http://localhost:8090
Mongo Express: http://localhost:8082
Elasticsearch: http://localhost:9200

Building Custom Image
docker-compose build nuxeo
docker-compose up -d nuxeo
Viewing Logs
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f nuxeo
docker-compose logs -f kafka
Accessing Container Shell
docker exec -it nuxeo bash
Important Notes

Java Version: This setup uses Java 11 because Nuxeo 10.10 only supports Java 8 or 11
Nuxeo LTS 2025: If you need the latest Nuxeo LTS 2025, note that it requires Java 21 or later
CLID: The Nuxeo CLID is already configured in the environment variables

Contributing

Fork the repository
Create a feature branch (git checkout -b feature/your-feature)
Commit your changes (git commit -m 'Add your feature')
Push to the branch (git push origin feature/your-feature)
Open a Pull Request
Contact
Charul Thacker - charulthackert@gmail.com
Project Link: https://github.com/charul1811/2025-test
