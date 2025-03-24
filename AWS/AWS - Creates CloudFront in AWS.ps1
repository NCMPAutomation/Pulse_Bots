# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and CloudFront distribution parameters
$region = "us-east-1"  # CloudFront does not require a region but you can specify for your AWS tools
$originDomainName = "example-bucket.s3.amazonaws.com"  # Replace with your origin domain name (e.g., S3 bucket or custom origin)
$distributionComment = "My CloudFront Distribution"  # Replace with your desired comment
$defaultCacheBehavior = @{
    TargetOriginId = "S3Origin"  # Replace with your origin ID
    ViewerProtocolPolicy = "redirect-to-https"
    AllowedMethods = @("GET", "HEAD")
    CachedMethods = @("GET", "HEAD")
    DefaultTTL = 86400  # Time-to-live for cached objects in seconds (e.g., 1 day)
    MaxTTL = 31536000  # Maximum TTL for cached objects in seconds (e.g., 1 year)
    MinTTL = 0  # Minimum TTL for cached objects in seconds
}

# Create CloudFront distribution
$cloudfront = New-CFDistribution -DistributionConfig @{
    Origins = @(@{
        Id = "S3Origin"
        DomainName = $originDomainName
    })
    DefaultCacheBehavior = $defaultCacheBehavior
    Enabled = $true
    Comment = $distributionComment
} -Region $region

# Output CloudFront distribution details
Write-Host "CloudFront distribution created successfully."
Write-Host "Distribution ID: $($cloudfront.Distribution.Id)"
Write-Host "Domain Name: $($cloudfront.Distribution.DomainName)"
