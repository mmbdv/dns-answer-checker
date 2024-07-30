#!/bin/bash
rm .null &> /dev/null
check_dns() {
    local server=$1
    local domain=$2
    dig @$server $domain +short  
}

server1="" #DNS1 ip addr
server2="" #DNS2 ip addr
#list of domains
domains=("google.com" "youtube.com" "yandex.ru" "bing.com" "duckduckgo.com")

declare -A results1
for domain in "${domains[@]}"; do
    results1[$domain]=$(check_dns $server1 $domain)
done

declare -A results2
for domain in "${domains[@]}"; do
    results2[$domain]=$(check_dns $server2 $domain)
done

printf "%-30s %-40s %-40s\n" "Domain" "Server $server1" "Server $server2"
printf "%-30s %-40s %-40s\n" "------" "-----------------" "-----------------"
for domain in "${domains[@]}"; do
    IFS=$'\n' read -r -d '' -a addresses1 <<< "${results1[$domain]}"
    IFS=$'\n' read -r -d '' -a addresses2 <<< "${results2[$domain]}"

    max_len=${#addresses1[@]}
    if [ ${#addresses2[@]} -gt $max_len ]; then
        max_len=${#addresses2[@]}
    fi

    for (( i=0; i<$max_len; i++ )); do
        addr1="${addresses1[$i]}"
        addr2="${addresses2[$i]}"
        printf "%-30s %-40s %-40s\n" "$domain" "$addr1" "$addr2"
    done
done

echo ""
echo "Comparing DNS results:"
for domain in "${domains[@]}"; do
    if [[ "${results1[$domain]}" == "${results2[$domain]}" ]]; then
        echo "Domain: $domain - SAME"  >> .null
    else
        echo "Domain: $domain - DIFF" >> .null
    fi
done
cat .null | column -t
rm .null
