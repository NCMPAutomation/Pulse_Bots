# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the S3 bucket
$BucketName = "website bucket name"  # Replace with your desired bucket name

# Create the S3 bucket
New-S3Bucket -BucketName $BucketName -Region $Region

# Enable website hosting on the S3 bucket
Write-S3BucketWebsiteConfiguration `
    -BucketName $BucketName `
    -IndexDocument "index.html" `
    -ErrorDocument "error.html"

# Upload website files to the bucket
Write-S3Object `
    -BucketName $BucketName `
    -Key "index.html" `
    -File "C:\Path\To\Your\index.html"   # Replace with the path to your index.html file

Write-S3Object `
    -BucketName $BucketName `
    -Key "error.html" `
    -File "C:\Path\To\Your\error.html"   # Replace with the path to your error.html file

# Make the files public (update the bucket policy if necessary)
$BucketPolicy = @"
{
  ""Version"": ""2012-10-17"",
  ""Statement"": [
    {
      ""Sid"": ""PublicReadGetObject"",
      ""Effect"": ""Allow"",
      ""Principal"": ""*"",
      ""Action"": ""s3:GetObject"",
      ""Resource"": ""arn:aws:s3:::$BucketName/*""
    }
  ]
}
"@

Write-S3BucketPolicy -BucketName $BucketName -Policy $BucketPolicy

# Output the website URL
$WebsiteURL = "http://$BucketName.s3-website.$Region.amazonaws.com"
Write-Output "Your website is hosted at: $WebsiteURL"
