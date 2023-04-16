"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

# Подключение к базе данных
conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="postgres"
)

# Создание курсора
cur = conn.cursor()

# Открытие файла CSV
with open('./orders_data.csv', 'r') as f:
    # Пропуск заголовка
    next(f)
    # Копирование данных из файла в таблицу orders
    cur.copy_from(f, 'orders', sep=',')

with open('./customers_data.csv', 'r') as f:
    next(f)
    cur.copy_from(f, 'customers', sep=',')

with open('./employees_data.csv', 'r') as f:
    cur.copy_from(f, 'employees', sep=',')

# Фиксация транзакции
conn.commit()

# Закрытие соединения
conn.close()