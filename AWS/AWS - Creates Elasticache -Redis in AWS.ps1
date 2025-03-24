# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the ElastiCache Redis cluster
$CacheClusterId = "Cluster ID" #example my-redis-cluster
$CacheNodeType = "Type of the node" #example cache.t2.micro
$Engine = "redis"
$NumCacheNodes = 1
$SecurityGroupIds = @("Security group id") # Replace with your Security Group ID example sg-0123456789abcdef0
$SubnetGroupName = "Subnet group"         # Replace with your Subnet Group name

# Create a Redis cluster
New-EC2ElastiCacheCluster `
    -Region $Region `
    -CacheClusterId $CacheClusterId `
    -CacheNodeType $CacheNodeType `
    -Engine $Engine `
    -NumCacheNodes $NumCacheNodes `
    -SecurityGroupIds $SecurityGroupIds `
    -CacheSubnetGroupName $SubnetGroupName `
    -EngineVersion "6.x" # Specify the Redis engine version