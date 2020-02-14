# Azcopy

azcopy.exe is needed to run the azcopy commands from the script and the path needs to be defined in the "Start-Process" command

# AzcopySync

AzcopySync will connect to the directed blob storage account and sync all files from it to the chosen localpath. 

# AzcopySyncUpload

AzcopySyncUpload will connect to the directed blob storage account and upload all files from the localpath directory to the blob stoarge. 

# Notes

A dialog box will appear to have the user sign into their azure account. This can be fixed to silent-sign-on, but will require some updating to the code using azure client secrets and key vaults in the future.
