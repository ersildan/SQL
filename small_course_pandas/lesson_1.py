import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

'''Для начала познакомимся с базовыми структурами данных. В Pandas их всего двe: Series и DataFrame.
Series – одномерный массив, в котором может хранится любой тип данных
Пример создания объекта Series:'''

base1 = pd.Series([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
#print(base1) # первый столбец будет индекс элемента, второй столбец сам элемент в конце строка о dtype: int 64

'''DataFrame – двумерная структура данных, хранящая данные в виде двумерного массива или таблицы 
(похожей на ту, что в Excel)
Пример создания двух объектов DataFrame:'''

base2 = pd.DataFrame(
                    np.random.randn(5, 4),
                    index = ['A', 'B', 'C', 'D', 'E'],
                    columns = ['W', 'X', 'Y', 'Z'])
#print(base2)

base3 = pd.DataFrame([
                      { 'A': 1, 'B': 2, 'C': 3, 'D': 4},
                      { 'A': 5, 'B': 6, 'C': 7, 'D': 8},
                      { 'A': 9, 'B': 10, 'C': 11, 'D': 12}
])
#print(base3)

sns_df = sns.load_dataset('titanic') # Встроенные датасет
# print(sns_df.head()) # эту функцию рассмотрим подробнее в следующем стэпе (посмотреть первые пять строк)
# print(sns_df) вывод всех данных 15 сначала и 15 с конца - середина ...
# print(sns_df.tail()) # выводит последние 5 строк
#sample_df = sns_df.sample(frac=0.3, replace=True)
#print(sample_df)

# print(sns_df.shape) # 891 строка и 15 столбцов
# print(sns_df.columns) # выведет список всех столбцов
# print(sns_df.dtypes) # пишет какой тип элементов
#sns_df.notnull().sum()
print(sns_df.tail(-5))