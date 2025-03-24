# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the MSK Cluster
$ClusterName = "MyKafkaCluster"
$BrokerNodeCount = 3                         # Number of broker nodes
$BrokerNodeType = "kafka.m5.large"           # Replace with your preferred broker node instance type
$KafkaVersion = "3.3.1"                      # Specify the desired Kafka version
$SubnetIds = @("subnet-0123456789abcde1", "subnet-0123456789abcde2") # Replace with your Subnet IDs
$SecurityGroupIds = @("sg-0123456789abcdef0")                        # Replace with your Security Group ID

# Storage per Broker (in GiB)
$StorageVolumeSize = 100

# Create the MSK provisioned cluster
$MSKCluster = New-MSKCluster `
    -Region $Region `
    -ClusterName $ClusterName `
    -NumberOfBrokerNodes $BrokerNodeCount `
    -BrokerNodeGroupInfo_InstanceType $BrokerNodeType `
    -BrokerNodeGroupInfo_ClientSubnets $SubnetIds `
    -BrokerNodeGroupInfo_SecurityGroups $SecurityGroupIds `
    -BrokerNodeGroupInfo_StorageInfo_EbsStorageInfo_VolumeSize $StorageVolumeSize `
    -KafkaVersion $KafkaVersion

# Output cluster ARN
Write-Output "MSK Provisioned Cluster created with ARN: $($MSKCluster.ClusterArn)"
