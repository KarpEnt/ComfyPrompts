
$SQLDB_SRC = "C:\Development\ComfyUI_custom_nodes\database"
$NODE_SRC = "C:\Development\ComfyUI_custom_nodes\source\MyPromptsNode"
$NODE_DEST = "C:\Apps\ComfyUI\custom_nodes\MyPromptsNode"

Write-Host "Kopiowanie bazy danych..."
Set-Location -Path $SQLDB_SRC
Copy-Item -Path "prompts_db.db" -Destination $NODE_DEST

Write-Host "Kopiowanie węzła..."
Set-Location -Path $NODE_SRC
Copy-Item -Path "__init__.py" -Destination $NODE_DEST
Copy-Item -Path "nodes.py" -Destination $NODE_DEST

# powrót do folderu początkowego
Set-Location -Path "C:\Development\ComfyUI_custom_nodes"