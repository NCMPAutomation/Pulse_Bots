# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the ElastiCache Memcached cluster
$CacheClusterId = "my-memcached-cluster"
$CacheNodeType = "Instance type"           # Specify your desired instance type example cache.t2.micro
$Engine = "memcached"
$NumCacheNodes = 2                         # Number of nodes in the cluster
$SecurityGroupIds = @("Security Group ID") # Replace with your Security Group ID example sg-0123456789abcdef0
$SubnetGroupName = "my-subnet-group"       # Replace with your Subnet Group name

# Create a Memcached cluster
New-EC2ElastiCacheCluster `
    -Region $Region `
    -CacheClusterId $CacheClusterId `
    -CacheNodeType $CacheNodeType `
    -Engine $Engine `
    -NumCacheNodes $NumCacheNodes `
    -SecurityGroupIds $SecurityGroupIds `
    -CacheSubnetGroupName $SubnetGroupName `
    -EngineVersion "1.6.17" # Specify the Memcached engine version
