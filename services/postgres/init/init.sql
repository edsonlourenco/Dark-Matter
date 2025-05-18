DO
$$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_user
      WHERE  usename = 'airflow') THEN

      CREATE USER airflow WITH PASSWORD 'airflow';
   END IF;
END
$$;

GRANT ALL PRIVILEGES ON DATABASE airflow TO airflow;

CREATE USER airflow WITH PASSWORD 'airflow';
GRANT ALL PRIVILEGES ON DATABASE airflow TO airflow;