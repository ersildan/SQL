import sqlite3

"""Подключение к существующей базе данных"""

db = sqlite3.connect("test.sql.db") # Подключение к базе данных
print("Подключились к БД")
cur = db.cursor() # Переменная для управления базы данных

cur.execute("SELECT * FROM Students;") # запрос для получения содержимого таблицы Students
result = cur.fetchall() # Результат запроса
print(result)
