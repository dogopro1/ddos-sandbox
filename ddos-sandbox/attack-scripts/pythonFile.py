import requests

target = input("Enter target URL: ")

while True:
    r = requests.get(target)
    print(r.status_code)
