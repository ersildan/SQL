import sqlite3

db = sqlite3.connect('test.sql.db') # Подключение к БД
cur = db.cursor() # Переменная для управления БД

cur.execute("""SELECT * FROM Students;""")

result_one = cur.fetchone() # Одно значений
name = result_one[1]
print(result_one) # (1, 'Ivan', 'Ivanov')
print(name) # Ivan

# result_many = cur.fetchmany(2) # Несколько значений
# print(result_many) # [(1, 'Ivan', 'Ivanov'), (2, 'Petr', 'Petrov')]


result_all = cur.fetchall() # Результат запроса всех данных
print(result_all)
print(result_all[0])
print(result_all[1])

"""Важно помнить, что вызвав методы раньше, то во второй раз для следующего метода будет меньше данных, 
так как первая часть данных уже сохранена в ранее вызванных методах"""