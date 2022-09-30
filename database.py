# database.py
import sqlite3

DB_FILE = 'ctm.db'

def init_db():
    conn = sqlite3.connect(DB_FILE)
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS clients (id INTEGER PRIMARY KEY, name TEXT, email TEXT)''')
    c.execute('''CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY, client_id INTEGER, amount REAL, date TEXT, description TEXT, FOREIGN KEY(client_id) REFERENCES clients(id))''')
    conn.commit()
    conn.close()
# 2020-02-15: DB setup
# 2020-03-01: Client table
# 2020-03-01: Client table
# 2020-02-15: DB setup
# 2020-03-01: Client table
# 2020-03-01: Client table
# 2021-03-01: Client table
# 2021-03-01: Client table
# 2021-02-15: DB setup
# 2021-03-01: Client table
# 2021-02-15: DB setup
# 2021-03-01: Client table
# 2021-03-01: Client table
# 2021-03-01: Client table
# 2022-03-01: Client table
