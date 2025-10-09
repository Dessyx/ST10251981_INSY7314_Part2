#!/bin/bash
# Bash script to create .env file for MongoDB Atlas setup

ENV_PATH=".env"

if [ -f "$ENV_PATH" ]; then
    echo "⚠ .env file already exists!"
    read -p "Do you want to overwrite it? (yes/no): " response
    if [ "$response" != "yes" ]; then
        echo "Cancelled. .env file was not modified."
        exit 1
    fi
fi

cat > "$ENV_PATH" << 'EOF'
# MongoDB Connection (from your teammate's setup)
MONGO_URI=mongodb+srv://soyamapango15_db_user:lJZGLadcp08eK1Lu@paynowdb.vmyr5pc.mongodb.net/paynow?retryWrites=true&w=majority

# Security Secrets (generate secure random strings for production!)
JWT_SECRET=dev_jwt_secret_change_in_production_12345
PEPPER=dev_pepper_secret_change_in_production_67890
COOKIE_SECRET=dev_cookie_secret_change_in_production_abcde

# Server Configuration
NODE_ENV=development
PORT=4000
EOF

echo "✅ .env file created successfully!"
echo ""
echo "Next steps:"
echo "1. Run: npm install"
echo "2. Run: npm run seed-admin"
echo "3. Run: npm start"

