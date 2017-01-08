#!/bin/sh -

curl "https://nordvpn.com/wp-admin/admin-ajax.php?searchParameters%5B0%5D%5Bname%5D=proxy-country&searchParameters%5B0%5D%5Bvalue%5D=&searchParameters%5B1%5D%5Bname%5D=proxy-ports&searchParameters%5B1%5D%5Bvalue%5D=&searchParameters%5B2%5D%5Bname%5D=http&searchParameters%5B2%5D%5Bvalue%5D=on&searchParameters%5B3%5D%5Bname%5D=https&searchParameters%5B3%5D%5Bvalue%5D=on&searchParameters%5B4%5D%5Bname%5D=socks4&searchParameters%5B4%5D%5Bvalue%5D=on&searchParameters%5B5%5D%5Bname%5D=socks4%2F5&searchParameters%5B5%5D%5Bvalue%5D=on&searchParameters%5B6%5D%5Bname%5D=socks5&searchParameters%5B6%5D%5Bvalue%5D=on&offset=0&limit=1000&action=getProxies" > 1000_proxies.txt
cat 1000_proxies.txt | grep -oP "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" > IPs.txt
cat 1000_proxies.txt | grep -oP "t\":\"[0-9]{2,}" | grep -oP "[0-9]{2,}" > Ports.txt
paste -d ":" IPs.txt Ports.txt > 1000_proxies.txt
rm IPs.txt Ports.txt
exit 0
