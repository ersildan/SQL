import sqlite3

db = sqlite3.connect('test.sql.db') # Подключаемся к БД
cur = db.cursor() # Создаем курсор для управления БД


"""Изменение данных в таблице"""

# Снизу используется не безопасный способ
# cur.execute("""
#     UPDATE Students
#     SET First_name = 'Aka', Last_name = 'Pochov'
#     WHERE StudentsID = 3
#
# """) # Обновляем по StudentsID равный 3 First_name и Last_name

# Используем безопасный способ
update_params = ('Anna','Sokolova', 4)
cur.execute("""
    UPDATE Students
    SET First_name = ?, Last_name = ?
    WHERE StudentsID = ?;""", update_params)
db.commit() # Сохраняем изменения
