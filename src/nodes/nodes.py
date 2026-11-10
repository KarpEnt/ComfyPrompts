# Wersja 1

import sqlite3
import random
import os

DB_PATH = os.path.join(os.path.dirname(__file__), "prompts_db.db")


def get_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def fetch_classes():
    with get_connection() as conn:
        rows = conn.execute("SELECT code FROM classes ORDER BY code").fetchall()
    return [r["code"] for r in rows] or [""]


def fetch_models():
    with get_connection() as conn:
        rows = conn.execute("SELECT code FROM models ORDER BY code").fetchall()
    return [r["code"] for r in rows] or [""]


def fetch_prompt(prompt_id=0, code="", model=""):
    query = "SELECT body FROM prompts"
    params = []
    conditions = []

    if prompt_id and prompt_id > 0:
        conditions.append("id = ?")
        params.append(int(prompt_id))

    if code:
        conditions.append("class = ?")
        params.append(code)

    if model:
        conditions.append("model = ?")
        params.append(model)

    if conditions:
        query += " WHERE " + " AND ".join(conditions)

    query += " ORDER BY id ASC"

    with get_connection() as conn:
        rows = conn.execute(query, params).fetchall()

    if not rows:
        return ""

    return random.choice(rows)["body"]



class SqlPromptsNode:
    @classmethod
    def INPUT_TYPES(cls):
        return {
            "required": {
                "PROMPT_ID": ("INT", {"default": 0, "min": 0, "max": 999999, "step": 1}),
                "CODE": (fetch_classes(),),
                "MODEL": (fetch_models(),),
            }
        }

    RETURN_TYPES = ("STRING",)
    RETURN_NAMES = ("TEXT",)
    FUNCTION = "run"
    CATEGORY = "Custom"

    def run(self, PROMPT_ID, CODE, MODEL):
        text = fetch_prompt(PROMPT_ID, CODE, MODEL)
        return (text,)



# Rejestracja klasy, mapowanie klasy na klucz (klucz musi się zgadzać z nazwą w mapie)
NODE_CLASS_MAPPINGS = {
    "MyPromptsNode":  SqlPromptsNode,          # ← nazwa klasy
}

# Mapowanie wyświetlanej nazwy na klucz
NODE_DISPLAY_NAME_MAPPINGS = {
    "MyPromptsNode": "🖼️ SQL Prompts"
}
