\# End-to-End Data Engineering Pipeline: Global Climate \& Energy



This project demonstrates a robust \*\*ETL (Extract, Transform, Load)\*\* pipeline built with \*\*Python\*\*, \*\*Docker\*\*, and \*\*PostgreSQL\*\*. It processes real-world climate and energy data to analyze trends using advanced SQL techniques like Window Functions.



\## Key Features

\* \*\*Containerized Database:\*\* PostgreSQL infrastructure managed via Docker Compose.

\* \*\*Automated ETL:\*\* Python script (`main.py`) to ingest and clean CSV data.

\* \*\*Advanced Analytics:\*\* SQL scripts utilizing Window Functions (`LAG`) for time-series analysis.

\* \*\*Infrastructure as Code:\*\* Reproducible environment setup.



\## Tech Stack

\* \*\*Language:\*\* Python 3.9+ (Pandas, SQLAlchemy)

\* \*\*Database:\*\* PostgreSQL 13 (via Docker)

\* \*\*Containerization:\*\* Docker \& Docker Compose

\* \*\*Tools:\*\* DBeaver, Git, Bash



\## Project Structure

```text

.

├── main.py                  # ETL Script (Extracts CSV -> Loads to Postgres)

├── docker-compose.yaml      # Database Infrastructure Definition

├── requirements.txt         # Python Dependencies

├── analysis.sql             # SQL Analytical Queries (Window Functions)

├── .gitignore               # Git Ignore Rules

└── README.md                # Project Documentation

