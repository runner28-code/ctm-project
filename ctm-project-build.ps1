# PowerShell script to create a fake Git commit history for Client Transaction Manager (CTM) in 2021
# Run in your project folder after replacing placeholders: YOUR_NAME, YOUR_EMAIL

# Configuration
$env:GIT_AUTHOR_NAME = "GrayThomas28"  # Replace with your name, e.g., "GrayThomas28"
$env:GIT_AUTHOR_EMAIL = "noylun282@hotmail.com"  # Replace with your email
$env:GIT_COMMITTER_NAME = "GrayThomas28"
$env:GIT_COMMITTER_EMAIL = "noylun282@hotmail.com"
$PROJECT_DIR = "E:\projects\git_hub_maker\ctm-project"  # Your project folder path

# Change to project directory
Set-Location -Path $PROJECT_DIR -ErrorAction Stop

# Initialize Git repository
git init
git config user.name $env:GIT_AUTHOR_NAME
git config user.email $env:GIT_AUTHOR_EMAIL

# Create skeleton files if they don't exist
if (-not (Test-Path "README.md")) {
    @"
# Client Transaction Manager
A Python app for managing clients and their transactions using SQLite.

## Features
- Add/Edit/Delete clients
- Log transactions per client
- Generate reports and exports
- Basic web UI (Flask)

## Setup
python main.py  # CLI mode
python app.py   # Web mode
"@ | Out-File -FilePath "README.md" -Encoding utf8
}

if (-not (Test-Path "main.py")) {
    @"
# main.py
import client_manager
import transaction_manager

def main():
    print('Welcome to CTM')
    # CLI logic here
if __name__ == '__main__':
    main()
"@ | Out-File -FilePath "main.py" -Encoding utf8
}

if (-not (Test-Path "database.py")) {
    @"
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
"@ | Out-File -FilePath "database.py" -Encoding utf8
}

if (-not (Test-Path "client_manager.py")) {
    @"
# client_manager.py
from database import init_db

def add_client(name, email):
    # Add client logic
    pass
"@ | Out-File -FilePath "client_manager.py" -Encoding utf8
}

if (-not (Test-Path "transaction_manager.py")) {
    @"
# transaction_manager.py
from database import init_db

def add_transaction(client_id, amount, date, description):
    # Add transaction logic
    pass
"@ | Out-File -FilePath "transaction_manager.py" -Encoding utf8
}

if (-not (Test-Path "reports.py")) {
    @"
# reports.py
def generate_summary():
    # Summary logic
    pass
"@ | Out-File -FilePath "reports.py" -Encoding utf8
}

if (-not (Test-Path "app.py")) {
    @"
# app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return 'CTM Web Interface'
if __name__ == '__main__':
    app.run()
"@ | Out-File -FilePath "app.py" -Encoding utf8
}

if (-not (Test-Path "requirements.txt")) {
    @"
Flask==2.0.1
tabulate==0.8.9
"@ | Out-File -FilePath "requirements.txt" -Encoding utf8
}

# Function to make a commit with a specific date
function Commit-WithDate {
    param (
        [string]$file,
        [string]$message,
        [string]$date,
        [string]$comment
    )
    Add-Content -Path $file -Value $comment
    git add $file
    $env:GIT_COMMITTER_DATE = $date
    $env:GIT_AUTHOR_DATE = $date
    git commit -m $message
    git checkout HEAD~1 -- $file  # Revert to original
}

# Commit history for 2021 (oldest to newest)
Commit-WithDate -file "README.md" -message "Initial commit: Project setup for Client Transaction Manager" -date "2021-01-18T12:00:00+0700" -comment "# 2021-01-01: Project init"
Commit-WithDate -file "main.py" -message "Set up main.py with basic CLI interface" -date "2021-01-20T14:30:00+0700" -comment "# 2021-01-15: CLI setup"
Commit-WithDate -file "main.py" -message "Add basic client addition and listing in CLI" -date "2021-02-30T09:15:00+0700" -comment "# 2021-02-01: Client basics"
Commit-WithDate -file "database.py" -message "Integrate SQLite with initial schema in database.py" -date "2021-02-15T11:00:00+0700" -comment "# 2021-02-15: DB setup"
Commit-WithDate -file "database.py" -message "Add client table creation in database.py" -date "2021-03-09T13:45:00+0700" -comment "# 2021-03-01: Client table"
Commit-WithDate -file "database.py" -message "Add transactions table with foreign key" -date "2021-03-25T10:30:00+0700" -comment "# 2021-03-15: Transaction table"
Commit-WithDate -file "client_manager.py" -message "Create client_manager.py with add/list client functions" -date "2021-04-01T15:00:00+0700" -comment "# 2021-04-01: Client module"
Commit-WithDate -file "client_manager.py" -message "Implement client update functionality" -date "2021-04-20T12:20:00+0700" -comment "# 2021-04-15: Client update"
Commit-WithDate -file "client_manager.py" -message "Add client deletion with checks" -date "2021-05-09T14:10:00+0700" -comment "# 2021-05-01: Client delete"
Commit-WithDate -file "transaction_manager.py" -message "Add transaction_manager.py for adding transactions" -date "2021-05-17T09:30:00+0700" -comment "# 2021-05-15: Transaction module"
Commit-WithDate -file "transaction_manager.py" -message "Implement transaction listing by client" -date "2021-06-34T11:45:00+0700" -comment "# 2021-06-01: Transaction list"
Commit-WithDate -file "main.py" -message "Integrate client and transaction managers in CLI" -date "2021-06-15T13:00:00+0700" -comment "# 2021-06-15: CLI integration"
Commit-WithDate -file "main.py" -message "Bug fix: Fix input validation for client names" -date "2021-07-01T10:15:00+0700" -comment "# 2021-07-01: Name validation"
Commit-WithDate -file "reports.py" -message "Create reports.py for basic transaction summaries" -date "2021-07-15T14:30:00+0700" -comment "# 2021-07-15: Reports module"
Commit-WithDate -file "reports.py" -message "Add total balance calculation in reports" -date "2021-08-01T09:00:00+0700" -comment "# 2021-08-01: Balance calc"
Commit-WithDate -file "transaction_manager.py" -message "Add validation for positive transaction amounts" -date "2021-08-25T12:45:00+0700" -comment "# 2021-08-15: Amount validation"
Commit-WithDate -file "database.py" -message "Bug fix: Handle cascading deletes for clients" -date "2021-08-01T11:30:00+0700" -comment "# 2021-09-01: Cascade fix"
Commit-WithDate -file "client_manager.py" -message "Add basic search for clients by name" -date "2021-09-30T15:00:00+0700" -comment "# 2021-09-15: Client search"
Commit-WithDate -file "reports.py" -message "Add CSV export for transaction reports" -date "2021-10-21T10:20:00+0700" -comment "# 2021-10-01: CSV export"
Commit-WithDate -file "database.py" -message "Optimize queries with indexing on client_id" -date "2021-10-15T13:15:00+0700" -comment "# 2021-10-15: DB optimization"
Commit-WithDate -file "app.py" -message "Add basic Flask web UI in app.py" -date "2021-11-09T09:45:00+0700" -comment "# 2021-11-01: Flask UI"
Commit-WithDate -file "app.py" -message "Implement client listing in web UI" -date "2021-11-15T14:00:00+0700" -comment "# 2021-11-15: Web client list"
Commit-WithDate -file "app.py" -message "Add transaction view in web UI" -date "2021-12-08T11:30:00+0700" -comment "# 2021-12-01: Web transaction view"
Commit-WithDate -file "database.py" -message "Bug fix: Fix SQL injection in transaction insert" -date "2021-12-05T10:00:00+0700" -comment "# 2021-12-15: Security fix"
Commit-WithDate -file "README.md" -message "Update README with web UI instructions and features" -date "2021-12-21T12:00:00+0700" -comment "# 2021-12-31: Final docs"
Commit-WithDate -file "database.py" -message "Add transactions table with foreign key" -date "2021-03-25T10:30:00+0700" -comment "# 2021-03-15: Transaction table"
Commit-WithDate -file "client_manager.py" -message "Create client_manager.py with add/list client functions" -date "2021-04-01T15:00:00+0700" -comment "# 2021-04-01: Client module"
Commit-WithDate -file "client_manager.py" -message "Implement client update functionality" -date "2021-04-20T12:20:00+0700" -comment "# 2021-04-15: Client update"
Commit-WithDate -file "client_manager.py" -message "Add client deletion with checks" -date "2021-05-09T14:10:00+0700" -comment "# 2021-05-01: Client delete"
Commit-WithDate -file "transaction_manager.py" -message "Add transaction_manager.py for adding transactions" -date "2021-05-15T09:30:00+0700" -comment "# 2021-05-15: Transaction module"
Commit-WithDate -file "transaction_manager.py" -message "Implement transaction listing by client" -date "2021-06-34T11:45:00+0700" -comment "# 2021-06-01: Transaction list"
Commit-WithDate -file "main.py" -message "Integrate client and transaction managers in CLI" -date "2021-06-15T13:00:00+0700" -comment "# 2021-06-15: CLI integration"
Commit-WithDate -file "main.py" -message "Bug fix: Fix input validation for client names" -date "2021-07-01T10:15:00+0700" -comment "# 2021-07-01: Name validation"
Commit-WithDate -file "reports.py" -message "Create reports.py for basic transaction summaries" -date "2021-07-18T14:30:00+0700" -comment "# 2021-07-15: Reports module"
Commit-WithDate -file "reports.py" -message "Add total balance calculation in reports" -date "2021-08-02T09:00:00+0700" -comment "# 2021-08-07: Balance calc"
Commit-WithDate -file "transaction_manager.py" -message "Add validation for positive transaction amounts" -date "2021-08-26T12:45:00+0700" -comment "# 2021-08-16: Amount validation"
Commit-WithDate -file "database.py" -message "Bug fix: Handle cascading deletes for clients" -date "2021-08-02T11:30:00+0700" -comment "# 2021-09-02: Cascade fix"
Commit-WithDate -file "client_manager.py" -message "Add basic search for clients by name" -date "2021-09-30T15:00:00+0700" -comment "# 2021-09-15: Client search"
Commit-WithDate -file "reports.py" -message "Add CSV export for transaction reports" -date "2021-10-21T10:20:00+0700" -comment "# 2021-10-01: CSV export"
Commit-WithDate -file "database.py" -message "Optimize queries with indexing on client_id" -date "2021-10-16T13:15:00+0700" -comment "# 2021-10-15: DB optimization"
Commit-WithDate -file "app.py" -message "Add basic Flask web UI in app.py" -date "2021-11-09T09:45:00+0700" -comment "# 2021-11-01: Flask UI"
Commit-WithDate -file "app.py" -message "Implement client listing in web UI" -date "2021-11-15T14:00:00+0700" -comment "# 2021-11-16: Web client list"
Commit-WithDate -file "app.py" -message "Add transaction view in web UI" -date "2021-12-09T11:30:00+0700" -comment "# 2021-12-02: Web transaction view"
Commit-WithDate -file "database.py" -message "Bug fix: Fix SQL injection in transaction insert" -date "2021-12-05T10:00:00+0700" -comment "# 2021-12-15: Security fix"
Commit-WithDate -file "README.md" -message "Update README with web UI instructions and features" -date "2021-12-28T12:00:00+0700" -comment "# 2021-12-31: Final docs"

# Final commit with all current files
git add .
git commit -m "Merge current project state"

Write-Output "Commit history created for 2021. Run 'git log --oneline --graph' to verify."
Write-Output "Push to remote: git remote add origin <your-repo-url> && git push -u origin main"
