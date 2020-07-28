from flask import render_template, request
from flask import redirect, url_for
import os

from app.face_detector import pipeline
from app import utils

UPLOAD_FOLDER = 'static/uploads'

def index():
    if request.method == "POST":
        f = request.files['image']
        filename=  f.filename
        path = os.path.join(UPLOAD_FOLDER,filename)
        print(os.listdir())
        print(path)
        f.save(path)
        w = utils.get_width(path)
        pipeline(path, filename)
        return render_template('index.html',fileupload=True,img_name=filename, w=w)

    return render_template('index.html')
