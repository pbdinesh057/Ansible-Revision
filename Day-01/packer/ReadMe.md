Steps : 

1 - Change the Public key.
    
    # If you dont know what is public key, Login to the daily used instance for devsecops and enter ssh-key gen and copy  
      the public key and paste it under  LINE 37 - in Packer.json file.

    or

    # if you already have public key check under this location ".ssh/authorized_keys""

2 - Under var.json . please do the changes accordingly. 

3 - DONT PASS ACCESSKEY SECRETE KEY DIRECTLY INSTEAD, COPY AND PASTE IN POWERSHELL AS AN ENV VARIABLES AS SHOWN BELOW. 
    
$Env:AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXX"
$Env:AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXX"
$Env:AWS_DEFAULT_REGION="us-east-1"

![image](https://github.com/user-attachments/assets/d8bbee77-dc2b-4594-ab72-e046d2698b66)


4 - RUN THE BELOW COMMANDS . 
    packer validate --var-file vars.json packer.json
    packer inspect --var-file vars.json packer.json
    packer build --var-file vars.json packer.json


## IF YOU DIDNT ABLE TO UNDERSTAND ABOVE STEPS - PLEASE STOP LEARNING DEVOPS AND START LEARNIN SAP ##
