import sqlite3

db = sqlite3.connect('test.sql.db') # Подключение к БД
cur = db.cursor() # Управление БД

# update_params = '5'
# cur.execute("""
#     UPDATE Students
#     SET StudentsID = ?
#     WHERE StudentsID = 6;""", update_params)
# db.commit()

# """Удаление данных из таблицы С безопасным способом"""
#
# delete_params = '3'
# cur.execute("""
#     DELETE FROM Students
#     WHERE StudentsID = ?;
# """, delete_params) # Удаляем строку безопасным способом с Students = 3
#
# db.commit() # Сохраняем изменения в БД

"""Удаление таблиц"""

cur.executescript("""
    DROP TABLE Students1;
    DROP TABLE Students2;
    DROP TABLE Students3
""")

db.commit() # Сохраняем изменения