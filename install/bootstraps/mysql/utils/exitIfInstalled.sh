# EXIT IF INSTALLED
# VALIDATE THE INSTALLATION HOME DIRECTORY AND IF EXISTS, EXIT SCRIPT

mySqlHome=$1
if [ -d $mySqlHome ]; then
    echo mySQL Already installed EXITING
    return
fi
