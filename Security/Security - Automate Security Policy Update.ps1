# Define the policy path
$PolicyPath = "C:\Policies\SecurityPolicy.inf"

# Apply the security policy
secedit /configure /db secedit.sdb /cfg $PolicyPath /overwrite