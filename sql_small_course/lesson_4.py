import sqlite3

db = sqlite3.connect('test.sql.db') # Подключаемся к Базе Данных
cur = db.cursor() # Курсор для управления БД


"""Безопасный способ - Заполнение таблицы Students"""

# data_students = ('Андрюха', 'Андрюхов')
data_students = [('Alex','Aleksandrov'), ('Olga', 'Olgina')]
cur.executemany("""INSERT INTO Students(First_name, Last_name)
        VALUES (?, ?)""", data_students)  # Меняем с cur.execute на cur.executemany так как передаем уже несколько значений
db.commit() # Сохраняем все изменения
print("Добавление данных в таблицу")

