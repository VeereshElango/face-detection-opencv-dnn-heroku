# Face Detecion App

The application is deployed in this link
https://veer-facedetectionapp.herokuapp.com/ .

### Goal
The goal of this project was to transform a simple
machine learning application into a scalable production application with CI & CD functionality.

### Problem
A web based application to detect the face of [A.P.J.Abdul Kalam](https://en.wikipedia.org/wiki/A._P._J._Abdul_Kalam)
on a given picture

### Run this application using Docker
Step 0 : Make sure you have installed Docker in your OS. In case if you have not installed Docker, follow the 
instructions [here](https://docs.docker.com/engine/install/).  

**Step 1 :** 

``git clone https://github.com/VeereshElango/face-detection-opencv-dnn-heroku.git``

**Step 2 :**

``cd face-detection-opencv-dnn-heroku``

``docker build -it facedetection .``

``docker run -it -d -p 8000:5000 facedetection``

If port 8000 is already in use in your machine, replace with any 
other convenient port number. 

**Step 3 :**

Open the following link in your browser

http://localhost:8000/


