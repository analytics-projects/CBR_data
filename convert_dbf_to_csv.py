#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May  7 13:26:17 2021

@author: adventurer
"""
import os
import csv
from dbfread import DBF
import datetime
import pandas as pd
from pathlib import Path

home_dir = '/home/username/Documents/Career/Projects/CBR_banks/101-20200101'
os.chdir(home_dir)

# make dates for folder navigation
start = datetime.datetime(2015, 1, 1)
end = datetime.datetime(2021, 4, 1)
index = pd.date_range(start, end, freq="MS")

years = list(index.year)
months = list(index.strftime('%m'))
days = list(index.strftime('%d'))

# make folder names (files for every month are in their own folder)
def make_folder_name(year, month, day):
    return '101-' + str(year) + str(month) + str(day)

# for every folder find .dbf files and convert them to .csv
for dates in zip(years, months, days):
    folder_name = make_folder_name(dates[0], dates[1], dates[2])
    os.chdir('../' + folder_name)
    for file in os.listdir():
        name = Path(file).stem
        extension = Path(file).suffix
        if extension == '.DBF' or extension == '.dbf':
            table = DBF(file, encoding='cp866')
            with open(name + '.csv', 'w', newline='') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(table.field_names)
                for record in table:
                    writer.writerow(list(record.values()))                    
