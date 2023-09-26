import os
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World Again!"

@app.route("/add")
def add():
    val1 = request.args.get('val1')
    val2 = request.args.get('val2')
    sum = int(val1) + int(val2)
    return str(sum)


if __name__ == '__main__':
    app.run(threaded=True,host='0.0.0.0',port=80)