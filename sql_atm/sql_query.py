import sqlite3

class SQL_atm:

    """Создание таблицы Users_data"""
    @staticmethod
    def create_table():
        with sqlite3.connect("atm.db") as db:
            cur = db.cursor() # Переменная для управления запросом
            cur.execute("""CREATE TABLE IF NOT EXISTS Users_data(
            UserID INTEGER PRIMARY KEY AUTOINCREMENT,
            Number_card INTEGER NOT NULL,
            Pin_code INTEGER NOT NULL,
            Balance INTEGER NOT NULL);""")
            print("Создание таблицы Users_data")

    """Создание нового пользователя в Users_data"""

    @staticmethod
    def insert_users(data_users):
        with sqlite3.connect("atm.db") as db:
            cur = db.cursor()  # Переменная для управления запросом
            cur.execute("""INSERT INTO Users_data (Number_card, Pin_code, Balance) VALUES(?,?,?);""", data_users)
            print("Создание нового пользователя")


    """Ввод и проверка карты"""

    @staticmethod
    def input_card(number_card):
        try:
            with sqlite3.connect("atm.db") as db:
                cur = db.cursor() # Переменная для управления запросом
                cur.execute(f"""SELECT Number_card FROM Users_data WHERE Number_card = {number_card}""")
                result_card = cur.fetchone()
                if result_card == None:
                    print('Введен неизвестный номер карты')
                else:
                    print(f'Введен номер карты: {number_card}')


        except:
            print("Ошибка: введен некорректный номер карты")