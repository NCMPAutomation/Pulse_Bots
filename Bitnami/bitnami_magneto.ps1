# Define variables
$magentoDownloadUrl = "https://magento.com/tech-resources/download" # Replace with the actual Magento download URL
$magentoZipPath = "C:\Temp\magento.zip"                            # Path to save the Magento ZIP file
$magentoInstallPath = "C:\xampp\htdocs\magento"                    # Path to extract and install Magento
$phpPath = "C:\xampp\php\php.exe"                                  # Path to PHP executable
$composerPath = "C:\ProgramData\ComposerSetup\bin\composer.bat"    # Path to Composer executable

# Step 1: Download Magento
Write-Output "Downloading Magento..."
Invoke-WebRequest -Uri $magentoDownloadUrl -OutFile $magentoZipPath

if (!(Test-Path $magentoZipPath)) {
    Write-Error "Failed to download Magento. Exiting."
    exit
}
Write-Output "Magento downloaded successfully to $magentoZipPath."

# Step 2: Extract Magento
Write-Output "Extracting Magento..."
Expand-Archive -Path $magentoZipPath -DestinationPath $magentoInstallPath -Force

if (!(Test-Path $magentoInstallPath)) {
    Write-Error "Failed to extract Magento. Exiting."
    exit
}
Write-Output "Magento extracted successfully to $magentoInstallPath."

# Step 3: Install Composer Dependencies
Write-Output "Installing Composer dependencies..."
Set-Location -Path $magentoInstallPath
& $composerPath install

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Composer dependencies. Exiting."
    exit
}
Write-Output "Composer dependencies installed successfully."

# Step 4: Set Up Magento
Write-Output "Setting up Magento..."
& $phpPath "bin/magento" "setup:install" `
    "--base-url=http://localhost/magento" `
    "--db-host=localhost" `
    "--db-name=magento" `
    "--db-user=root" `
    "--db-password=yourpassword" `
    "--admin-firstname=Admin" `
    "--admin-lastname=User" `
    "--admin-email=admin@example.com" `
    "--admin-user=admin" `
    "--admin-password=admin123" `
    "--language=en_US" `
    "--currency=USD" `
    "--timezone=America/New_York" `
    "--use-rewrites=1"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to set up Magento. Exiting."
    exit
}
Write-Output "Magento setup completed successfully."

# Step 5: Start the Web Server
Write-Output "Starting the web server..."
Start-Process -FilePath "C:\xampp\xampp-control.exe"

Write-Output "Magento is now installed and running. Access it at http://localhost/magento."
