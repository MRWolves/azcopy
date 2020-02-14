# Needed if Azcopy program isn't install by the company and needed to be done indviually by the user.
#(curl https://aka.ms/downloadazcopy-v10-windows -MaximumRedirection 0 -ErrorAction silentlycontinue).RawContent
#Invoke-WebRequest https://azcopyvnext.azureedge.net/release20191212/azcopy_windows_amd64_10.3.3.zip -OutFile azcopyv10.zip


# Connect to Azure
Connect-AzAccount

 
# Azure Resource Information
$subscriptionId = "0a7f6507-6ac5-4f0a-8c27-754a7eb90d47"
$storageAccountRG = "PhillyDevCenter-D01"
$storageAccountName = "azcopyimage"
$storageContainerName = "images"


# Paths to local files
$localPathToImages = "C:\Users\N1600217\OneDrive - Munich Re\Documents\Azcopy_Images\images"
$localPathToAzcopy = "C:\Users\N1600217\OneDrive - Munich Re\Documents\Azcopy_Images\azcopy.exe"
 
# Select right Azure Subscription
Select-AzSubscription -SubscriptionId $SubscriptionId
 
# Get Storage Account Key
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountRG -AccountName $storageAccountName).Value[0]
 
# Set AzStorageContext
$destinationContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
 
# Generate SAS URI
$containerSASURI = New-AzStorageContainerSASToken -Context $destinationContext -ExpiryTime(get-date).AddSeconds(3600) -FullUri -Name "$storageContainerName" -Permission rw


# Upload File using AzCopy
Start-Process -FilePath "$localPathToAzcopy" -ArgumentList "copy `"$localPathToImages`" $containerSASURI  --recursive" -NoNewWindow
