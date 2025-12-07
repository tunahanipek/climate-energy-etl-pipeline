import pandas as pd
from sqlalchemy import create_engine
import time

# 1. Database Connection
db_connection = create_engine('postgresql://user:password@localhost:5432/test_db')

print(" Climate and Energy datas are reading...")

try:
    # Read CSV File
    df = pd.read_csv('global_climate_energy_2020_2024.csv')
    
    # (String -> Datetime)
    df['date'] = pd.to_datetime(df['date'])
    
    print(f" File uploaded! In general there are {len(df)} row and {len(df.columns)} column.")
    print("--- Example from Data ---")
    print(df.head(3))

except FileNotFoundError:
    print(" ERROR: CSV file not found! Check the CSV file name!")
    exit()

print("\n Processing...")

# 3.(Ingestion)
start = time.time()
# Table name is 'climate_energy'
df.to_sql(name='climate_energy', con=db_connection, if_exists='replace', index=False, chunksize=2000)
finish = time.time()

print(f"\n Process is Done! {len(df)} row data is uploaded in {start - finish:.2f}.")