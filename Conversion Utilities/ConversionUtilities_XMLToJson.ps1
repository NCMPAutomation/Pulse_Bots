#Path to the XML file
$xmlFilePath = "C:\Users\Netcon\Downloads\sample_xml.xml"

# Read the content of the XML file and convert to XML object
$xml = New-Object XML
$xml.Load($xmlFilePath)

# Parse the XML and create an object array
$Array = @()
foreach ($val in $xml.note) {
    $Object = [PSCustomObject]@{
        #change the below variables as per the json body requirements
        to          = $val.to
        from         = $val.from
        heading = $val.heading
        body = $val.body
    }
    $Array += $Object
}

# Convert the array to JSON

$json = $Array | ConvertTo-Json
# Display the result
Write-Output $json
