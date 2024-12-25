IFS=$(echo -en "\n\b")
for ii in $(find . -maxdepth 1 -type d); do 
    #if [ "${ii}" != "." ]; then
    #    #echo "${ii}"
    #    echo "${ii}    $(find "${ii}" -type l -o -type d -o -type f | wc -l)"
    #fi
    echo -e "${ii}\t$(find "${ii}" -type l -o -type d -o -type f | wc -l)"
done | sort -n -k 2 | column -t
