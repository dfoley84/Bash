!/bin/bash
ENCRYPTFILE=$1
#IF STATMENT FOR HELPER -- 
if [ $1 = "--help" ]; then 
echo "Usage: `basename $0` [Options..]"
echo
echo "Welcome to the Shell Script this will Encrypted a File which you pass to the Script...."
echo
exit 0
fi
#CHECKING IF PARAMETER IS SET OR NOT 
if [ ! -z "$ENCRYPTFILE" ]; then
	if [[ -z "$ENCRYPTION_KEY" ]]; then #CHECKING IF ENV ENCRYPTION KEY IS SET OR NOT 

		# IF EMTPY PROMPT USER FOR PASSWORD..
		read -p "Please Enter a Passowrd for the Encyption: " ENCRYPT	
		openssl des3 -salt -in $ENCRYPTFILE -out $ENCRYPTFILE".enc" -pass pass:$ENCRYPT

	else  #IF SET USE THE PASSWORD..
		openssl des3 -salt -in $ENCRYPTFILE -out $ENCRYPTFILE".enc" -pass pass:$ENCRYPTION_KEY
	fi

else
   echo "Error No File Passed... Exiting Code"
   exit 2
fi

