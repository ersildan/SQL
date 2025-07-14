import sqlite3

"""Создание новой базы данных"""

db = sqlite3.connect("test.sql.db") # создание базы данных
print("Подключились к БД")
cur = db.cursor() # Переменная для управления базы данных

cur.execute("""CREATE TABLE IF NOT EXISTS  Students2(
    StudentsID INTEGER PRIMARY KEY AUTOINCREMENT,
    First_name TEXT NOT NULL,
    last_name TEXT NOT NULL);
""")
db.commit() # Сохраняем изменения
print("Создание таблицы Students2")
