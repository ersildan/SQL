import sqlite3

"""Задание обменник валюты"""


"""Создаем базу данных users_balance"""

db = sqlite3.connect('exchanger.db') # Создаем и подключаем БД
cur = db.cursor() # Переменная для управления БД
print("1. Создали и подключились к базе данных exchanger.db")


"""Создаём таблицу users_data, если она не создана.
Задаем названия и тип данных для колонок."""
cur.execute("""
    CREATE TABLE IF NOT EXISTS users_balance(
    UserID TEXT PRIMARY KEY,
    Balance_RUB FLOAT NOT NULL,
    Balance_USD FLOAT NOT NULL,
    Balance_EUR FLOAT NOT NULL
    );""")
print("2. Создали таблицу users_balance и задали типы данных для колонок")


"""Вносим первого пользователя в таблицу.
Безопасным способом от SQL-инъекций.
Игнорируем вставку, если он уже есть."""

money_params = ('Брюс Уэйн', 1000000.0, 1000.0, 100.0)
cur.execute("""
    INSERT OR IGNORE INTO users_balance (UserID, Balance_RUB, Balance_USD, Balance_EUR)
        VALUES (?, ?, ?, ?)""", money_params)
db.commit() # Сохраняем все изменения

exc_txt = """Курс валют:
1 USD = 70 RUB
1 EUR = 80 RUB
1 USD = 0,87 EUR
1 EUR = 1,15 USD"""

def update_balance_rub(amount, balance, choice_2, data):
    """Функция для обновления данных в Balance_RUB"""

    dict_exc = {
                '2': 70,
                '3': 80
    }

    print(amount, balance, choice_2, data)
    print()
    print(dict_exc)


def update_balance_usd(amount, balance, choice_2, data):
    """Функция для обновления данных в Balance_USD"""

    ...


def update_balance_eur(amount, balance, choice_2, data):
    """Функция для обновления данных в Balance_EUR"""

    ...



def check_amount(amount, choice_1):
    """Проверка amount на правильность ввода и на остаток баланса"""

    try:
        amount = float(amount.replace(',', '.')) # Проверка числа на float()
    except:
        raise Exception ('\033[31mОшибка\033[0m: Нужно вводить только цифры без букв')

    cur.execute("""SELECT * FROM users_balance;""") # Запрос в таблицу users_balance

    data = cur.fetchone() # Данные из первой строки в таблице users_balance
    balance = data[int(choice_1)] # Баланс выбранной валюты
    name_exc = cur.description[int(choice_1)][0] # Наименование валюты

    if amount > balance:
        raise Exception (f'\033[31mНедостаточно средств\033[0m: {name_exc} = {balance}\n'
                         'Повторите попытку')
    d = {
         '1': 'RUB',
         '2': 'USD',
         '3': 'EUR'
    }
    print(*[f"Введите [ {key} ] для обмена на {d[key]}"
           for key, value in d.items() if key != choice_1], sep='\n') # Выводим список доступных валют для обмена

    choice_2 = input() # Выбор пользователя на что он будет менять свою валюту
    match choice_2:
        case '1':
            update_balance_rub(amount, balance, choice_2, data)
        case '2':
            update_balance_usd(amount, balance, choice_2, data)
        case '3':
            update_balance_eur(amount, balance, choice_2, data)
        case _:
            raise Exception ("Произошла ошибка. Соблюдайте правильность ввода.")

def func():
    """Выбираем валюту для обмена"""

    while True:
        try:
            txt = ("Введите [ 1 ] если хотите обменять RUB\n"
                   "Введите [ 2 ] если хотите обменять USD\n"
                   "Введите [ 3 ] если хотите обменять EUR\n"
                   "Введите [ 4 ] чтобы вывести курс валют\n"
                   "Чтобы выйти введите любой символ")
            print(txt)

            choice_1 = input() # Выбор валюты от пользователя согласно тексту в txt

            match choice_1:
                case '1':
                    print('Сколько меняем RUB?')
                case '2':
                    print('Сколько меняем USD?')
                case '3':
                    print('Сколько меняем EUR?')
                case '4':
                    print(exc_txt)
                    raise Exception
                case _:
                    exit('Совершен выход из обменника')

            amount = input() # Желаемая сумма для обмена на другую валюту
            check_amount(amount, choice_1) # Проверка введенной суммы (amount)

            break
        except Exception as e:
            print(e)

func()
