A Flask template on Docker
===============================
Using the following repo:

+ Flask Template: https://github.com/sloria/cookiecutter-flask
+ Docker with uWSGI & Nginx: https://github.com/tiangolo/uwsgi-nginx-flask-docker

If you create a flask template with cookiecutter-flask, you basically need to copy five files and edit as you need.

- Dockerfile 
- nginx.conf 
- uwsgi.ini
- start_docker.py
- init_docker.sh

Quickstart (http://localhost:5000)
----------
'''
conda create -n py35env python=3.5
source activate py35env
git clone https://github.com/otwn/flask-on-docker
cd flask-on-docker
pip install -r requirements.txt
bower install
'''

Then run the following commands
```
export FLASK_APP=/path/to/autoapp.py
export FLASK_DEBUG=1
flask run
```

Quickstart (http://localhost:8000)
----------
    ./init_docker.sh
    

Configuration
=====

