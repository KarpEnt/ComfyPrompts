
import sqlite3

DB_PATH = "prompts.db"

# Połączenie z bazą
conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()

# Pobranie pierwszego rekordu
cursor.execute("SELECT * FROM prompts")
row = cursor.fetchone()

if row:
    print("Rekord:", row)
else:
    print("Brak danych")

# Zamknięcie połączenia
conn.close()