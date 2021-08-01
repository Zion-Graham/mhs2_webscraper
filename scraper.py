import requests
from bs4 import BeautifulSoup

url = "https://mhst.kiranico.com/mhs2/data/monsties"
req = requests.get(url)
soup = BeautifulSoup(req.content, 'html.parser')


def get_name(row):
    return row.div.get_text()


for row in list(soup.tbody.children)[:1]:
    for child in row.td.children:
        print(child.get_text("\n", strip=True))
