import sqlite3
from datetime import datetime

DB_PATH = "prompts.db"

# Dane nowego rekordu
body = "Przykładowy prompt"
prompt_type = "image"
model = "flux"

conn = sqlite3.connect(DB_PATH)

try:
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO prompts (
            body,
            type,
            model,
            created_at
        )
        VALUES (?, ?, ?, ?)
    """, (
        body,
        prompt_type,
        model,
        datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    ))

    conn.commit()

    new_id = cursor.lastrowid
    print(f"Dodano rekord ID={new_id}")

finally:
    conn.close()