#!/usr/bin/env python
# -*- coding:utf-8 -*-

apple = 'apple'
bananas = 'bananas'

dict = {
    # Quantity of apples: 1
    apple: 1,
    # Quantity of bananas: 2
    bananas: 2,
    # Quantity of grape:fruits: 3
    'grape:fruits': 3
}

# <C-g><C-g><C-g><C-g><Right>:
# pep8のエラーが出る

dict = {
    # Quantity of apples: 1
    apple          : 1,
    # Quantity of bananas: 2
    bananas        : 2,
    # Quantity of grape:fruits: 3
    'grape:fruits' : 3
}
