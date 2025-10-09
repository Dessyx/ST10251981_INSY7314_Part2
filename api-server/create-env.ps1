# PowerShell script to create .env file for MongoDB Atlas setup

$envContent = @"
# MongoDB Connection (from your teammate's setup)
MONGO_URI=mongodb+srv://soyamapango15_db_user:lJZGLadcp08eK1Lu@paynowdb.vmyr5pc.mongodb.net/paynow?retryWrites=true&w=majority

# Security Secrets (generate secure random strings for production!)
JWT_SECRET=dev_jwt_secret_change_in_production_12345
PEPPER=dev_pepper_secret_change_in_production_67890
COOKIE_SECRET=dev_cookie_secret_change_in_production_abcde

# Server Configuration
NODE_ENV=development
PORT=4000
"@

$envPath = ".env"

if (Test-Path $envPath) {
    Write-Host "⚠ .env file already exists!" -ForegroundColor Yellow
    $response = Read-Host "Do you want to overwrite it? (yes/no)"
    if ($response -ne "yes") {
        Write-Host "Cancelled. .env file was not modified." -ForegroundColor Red
        exit
    }
}

$envContent | Out-File -FilePath $envPath -Encoding utf8 -NoNewline
Write-Host "✅ .env file created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Run: npm install" -ForegroundColor White
Write-Host "2. Run: npm run seed-admin" -ForegroundColor White
Write-Host "3. Run: npm start" -ForegroundColor White

