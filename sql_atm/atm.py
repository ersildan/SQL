from sql_query import SQL_atm


class ATM():

    def atm_logic(self):

        SQL_atm.create_table()
        SQL_atm.insert_users((43121, 2222, 15000))
        number_card = input('Введите, пожалуйста, номер карты:\n')

        while True:
            if SQL_atm.input_card(number_card):
                print('Успех')
            else:
                break
start = ATM()
start.atm_logic()