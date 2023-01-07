import json
import os
from encodings import utf_8

import requests
from bs4 import BeautifulSoup as bs

data = []
r = requests.get('https://www.youtube.com/playlist?list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n')
page = r.text
soup=bs(page,'html.parser')
b  =  open("a.html","w",encoding="utf_8")
b.write(str(soup))
c  =  open("a.html","r",encoding="utf_8")

d = c.readlines()
lin = 0
while True:
    try:
        a = d[lin]
    except:
        print("Finished")
        break
    if '"url":"/watch?v=' in a:
        a = a.split('"url":"')
        te = 0
       
        while True:
            try:
                if "/watch?v=" in a[te]:
                    aa = a[te].split('",')
                    e = 0
                    while True:
                        try:
                            if "/watch?v=" in aa[e]:
                                url = "https://www.youtube.com"+aa[e]
                                #url is added in data if you want to print all url uncomment this code
                                print("\'" + url+"\',")
                                data.append(url)
                        except:
                            
                            break
                        e+=1
            
            except:
          
                
                break
            te +=1
            
    lin +=1
c.close()
b.close()
os.remove("a.html")
print("Given data is in list so you can print url by use this code print(data[0])\n\n")

print(data)