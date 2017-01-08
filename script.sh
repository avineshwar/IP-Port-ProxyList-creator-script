#!/bin/sh -

curl "https://nordvpn.com/wp-admin/admin-ajax.php?searchParameters%5B0%5D%5Bname%5D=proxy-country&searchParameters%5B0%5D%5Bvalue%5D=united+states&searchParameters%5B1%5D%5Bname%5D=proxy-ports&searchParameters%5B1%5D%5Bvalue%5D=8080%2C80%2C443&searchParameters%5B2%5D%5Bname%5D=http&searchParameters%5B2%5D%5Bvalue%5D=on&searchParameters%5B3%5D%5Bname%5D=https&searchParameters%5B3%5D%5Bvalue%5D=on&offset=0&limit=250&action=getProxies" > 250_proxies_USA_80_8080_443.txt
cat 250_proxies_USA_80_8080_443.txt | grep -oP "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" > IPs.txt
cat 250_proxies_USA_80_8080_443.txt | grep -oP "t\":\"[0-9]{2,}" | grep -oP "[0-9]{2,}" > Ports.txt
paste -d ":" IPs.txt Ports.txt > 250_proxies_USA_80_8080_443.txt
exit(0)
