touch results.txt
:> results.txt

cat hosts.txt | while read line; 
do
    if [ ! -z "$line" ];  then
        echo "Querying $line" 
        res=$(whois $line | grep -i "OrgName\|Registrant Organization\|Timeout" | tail -1)
        if [ -z "$res" ]; then
            res="Something's wrong"
        fi
        echo $line " " $res >> results.txt
    fi
done
echo -e "\nGoodbye\nWritten By Mazen A. Gaballah"
