!/bin/bash

#Variable for parameters
FILENAME=$@
#Helper
if [ $1 = "--help" ]; then
echo "Usage: `basename $0` [Options..]"
echo
echo "At the start of the Program Enter in the List of Files you wish to backup.. "
echo
echo " User will be Prompt with an Menu to Choice From "
echo " 1) 	Compression of Word Document Using TAR"
echo " 2)		Encpytion File using des3 "
exit 0
fi

#CHECKING IF PARAMETER IS SET OR NOT
if [ ! -z "$FILENAME" ]; then

	#Assign archived.txt to variable ARCHIVED,
	#Easier calling later on in the code
	ARCHIVED="archived1.txt"

	#Loop i for every element within $FILENAME
	for i in "$FILENAME" ; do

		#CAT out Contents of each file in $FILENAME to $ARCHIVED
		cat $i >$ARCHIVED;

	done
clear

	#Option List for Menu
	options="Compression Encryption Exit"

	#Echo out information to User
	echo -e "\nPlease pick if you wish to Compress or Encrypte the Archive File:\n"
	PS3="Enter Choice: "

	#Display a Menu for User to pick
		select choice in $options ; do
			case $choice in
				"Compression") # Compress $ARCHIVED
					 echo " "
					 echo -e "COMPRESSING..." tar -czvf archive.tar $ARCHIVED "\n"
					   echo -e "COMPRESSING DONE\n"
						COMPRESSEDFILE="archive.tar"
 			;;

				"Encryption") #Encryption
						if [ -f "$COMPRESSEDFILE" ]
							then
								read -p "Please Enter a Passowrd for the Encyption: " PASSKEY
 								openssl des3 -salt -in $ARCHIVED -out "Archvied.des" -pass pass:$PASSKEY
								openssl des3 -salt -in $COMPRESSEDFILE -out "CompressedArchived.des" -pass pass:$PASSKEY
							else
								read -p "Please Enter a Passowrd for the Encyption: " PASSKEY
								openssl des3 -salt -in $ARCHIVED -out "Archvied.des" -pass pass:$PASSKEY
						fi
					echo -e " "
					echo -e "ENCYPTION FINISHED\n"

			;;
				"Exit") #EXIT from Script
					echo -e "Quitting\n"
						break
			;;

				*) # Catch illegal inputs from User and Display Error Message.
					echo -e "\nNot a vaild Option please choose from the list above."
					echo " "
			;;
    			 esac
		done # Exit from Case
else
   echo "Error No File Passed... Exiting Code"
   exit 2
fi
