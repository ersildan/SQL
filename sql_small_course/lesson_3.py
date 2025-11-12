import sqlite3

db = sqlite3.connect('test.sql.db') # Подключаемся к Базе Данных
cur = db.cursor() # Курсор дня управления БД
cur.execute("""INSERT INTO Students2 (First_name, Last_name)
            VALUES ('Andy', 'Kuper');""")

db.commit() # Сохраняем изменения в БД