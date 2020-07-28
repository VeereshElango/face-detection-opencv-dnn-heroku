# https://www.freewalldownload.com/

from flask import Flask
from app import views
import os

app = Flask(__name__)

app.add_url_rule('/','index',views.index,methods=['GET','POST'])

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host = '0.0.0.0', port = port, debug= True)