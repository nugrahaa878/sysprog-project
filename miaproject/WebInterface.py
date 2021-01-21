import subprocess
from flask import Flask, request, render_template, redirect, url_for
from os import listdir,getcwd
from os.path import isfile, join
from wtforms import Form, validators
from wtforms.fields import StringField

app = Flask(__name__)

class AudioControl(Form):
    submit_button = StringField([validators.optional(), validators.length(max=10)])

@app.route('/', methods=["GET", "POST"])
def index():
    form = AudioControl()
    # if request.method == "POST":
    #     if request.form['submit_button'] == "play":
    #         subprocess.call(["bash", "./audio_control.sh", "play"])
    #         return redirect(url_for('index'))
    #     elif request.form['submit_button'] == "volumeup":
    #         subprocess.call(["bash", "./audio_control.sh", "inc"])
    #         return redirect(url_for('index'))
    #     elif request.form['submit_button'] == "volumedown":
    #         subprocess.call(["bash", "./audio_control.sh", "dec"])
    #         return redirect(url_for('index'))
    return render_template("index.html", form=form)

@app.route('/play', methods=["POST"])
def play():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "play"])
        return redirect(url_for('index'))
    return render_template("index.html")


@app.route('/volumeup', methods=["POST"])
def increase():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "inc"])
        return redirect(url_for('index'))
    return render_template("index.html")

@app.route('/volumedown', methods=["POST"])
def decrease():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "dec"])
        return redirect(url_for('index'))
    return render_template("index.html")