import sys
from flask import Flask

app = Flask(__name__)
port = int(sys.argv[1])

@app.route("/")
def index():
    return str(port)

app.run(port=port)

