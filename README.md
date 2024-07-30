./dns_check.sh 
----------------------------------------------------------------------------------------- example
Domain                         Server 8.8.8.8                           Server 8.8.4.4                          
------                         -----------------                        -----------------                       
google.com                     64.233.165.102                           64.233.165.101                          
google.com                     64.233.165.113                           64.233.165.102                          
google.com                     64.233.165.139                           64.233.165.138                          
google.com                     64.233.165.138                           64.233.165.113                          
google.com                     64.233.165.100                           64.233.165.100                          
google.com                     64.233.165.101                           64.233.165.139                          
youtube.com                    64.233.164.93                            64.233.164.136                          
youtube.com                    64.233.164.91                            64.233.164.91                           
youtube.com                    64.233.164.136                           64.233.164.190                          
youtube.com                    64.233.164.190                           64.233.164.93                           
yandex.ru                      77.88.55.88                              77.88.55.88                             
yandex.ru                      77.88.44.55                              77.88.44.55                             
yandex.ru                      5.255.255.77                             5.255.255.77                            
bing.com                       204.79.197.200                           204.79.197.200                          
bing.com                       13.107.21.200                            13.107.21.200                           
duckduckgo.com                 40.114.177.156                           40.114.177.156                          

Comparing DNS results:
Domain:  google.com      -  DIFF
Domain:  youtube.com     -  DIFF
Domain:  yandex.ru       -  SAME
Domain:  bing.com        -  SAME
Domain:  duckduckgo.com  -  SAME
