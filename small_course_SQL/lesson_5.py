import sqlite3

db = sqlite3.connect('test.sql.db') # Подключаемся к Базе Данных
cur = db.cursor() # Курсор для управления БД

"""Отправка нескольких запросов"""

cur.executescript("""CREATE TABLE IF NOT EXISTS  Students3(
    StudentsID INTEGER PRIMARY KEY AUTOINCREMENT,
    First_name TEXT NOT NULL,
    last_name TEXT NOT NULL);
    
    INSERT INTO Students3 (First_name, Last_name)
            VALUES ('Andy', 'Kuper');

""") # Выполняет сразу несколько запросов

db.commit() # Сохраняем изменения
print("Создание таблицы Students3")