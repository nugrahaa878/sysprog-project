import subprocess
from flask import Flask, request, render_template, redirect, url_for
from os import listdir,getcwd
from os.path import isfile, join

app = Flask(__name__)

class AudioControl(Form):
    submit_button = IntegerField(validators=[validators.InputRequired(), validators.NumberRange(min=0, max=100)])

# class AlarmForm(Form):
#     name=StringField(label="Alarm name", validators=[validators.InputRequired()])
#     ringtone=SelectField(label="Ringtone", validators=[validators.InputRequired()])
#     time = TimeField(label="Time", validators=[validators.InputRequired()])

# class TestSoundForm(Form):
#     ringtone=SelectField(label="Ringtone", validators=[validators.InputRequired()])


@app.route('/', methods=["GET", "POST"])
def index():
    return render_template("index.html")

@app.route('/play', methods=["POST"])
def play():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "play"])
        return redirect(url_for('index'))
    return render_template("index.html")


@app.route('/volumeup', methods=["POST"])
def play():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "inc"])
        return redirect(url_for('index'))
    return render_template("index.html")

@app.route('/volumedown', methods=["POST"])
def play():
    if request.method == "POST":
        subprocess.call(["bash", "./audio_control.sh", "dec"])
        return redirect(url_for('index'))
    return render_template("index.html")