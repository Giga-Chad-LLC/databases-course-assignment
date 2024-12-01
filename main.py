import psycopg2

config = dict({
    "host": "localhost",
    "port": "5432",
    "database_name": "db-course",
    "user": "root",
    "password": "123",
    "schema": "hse_project",
})

connection = psycopg2.connect(
    host=config["host"],
    port=config["port"],
    database=config["database_name"],
    user=config["user"],
    password=config["password"],
)

def main():
    # Set the schema to 'hse_project'
    with connection.cursor() as cursor:
        cursor.execute(f'SET search_path TO {config["schema"]};')
        rows = cursor.execute('SELECT * FROM users;')
        rows = cursor.fetchall()
        print(rows)

main()
