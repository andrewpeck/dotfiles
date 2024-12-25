IFS=$(echo -en "\n\b")
for ii in $(find . -maxdepth 1 -type d); do 
    if [ "${ii}" != "." ]; then
        echo -e "$(find "${ii}" -type l -o -type d -o -type f | wc -l) \t ${ii}"
        #echo -e "${ii}\t$(find "${ii}" -type l -o -type d -o -type f | wc -l)"
    fi
done | sort -n -k 1 # | column -t
