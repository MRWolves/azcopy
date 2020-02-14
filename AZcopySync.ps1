# Needed if Azcopy program isn't install by the company and needed to be done indviually by the user.
#(curl https://aka.ms/downloadazcopy-v10-windows -MaximumRedirection 0 -ErrorAction silentlycontinue).RawContent
#Invoke-WebRequest https://azcopyvnext.azureedge.net/release20191212/azcopy_windows_amd64_10.3.3.zip -OutFile azcopyv10.zip


# Connect to Azure
Connect-AzAccount

 
# Azure Resource Information
$azureBlobStore = "https://azcopyimage.blob.core.windows.net/images"

# Paths to local files
$localPathToImages = "C:\Users\N1600217\OneDrive - Munich Re\Documents\Azcopy_Images\images"
$localPathToAzcopy = "C:\Users\N1600217\OneDrive - Munich Re\Documents\Azcopy_Images\azcopy.exe"
 
# Upload File using AzCopy
Start-Process -FilePath "$localPathToAzcopy" -ArgumentList "sync `"$azureBlobStore`" `"$localPathToImages`" --recursive" -NoNewWindow


