===============================
A Flask template on Docker
===============================
Using the following repo:
Flask Template: https://github.com/sloria/cookiecutter-flask
Docker with uWSGI & Nginx: https://github.com/tiangolo/uwsgi-nginx-flask-docker

If you create a flask template with cookiecutter-flask, you basically needs to copy five files and edit as you need.
- Dockerfile 
- nginx.conf 
- uwsgi.ini
- start_docker.py
- init_docker.sh

Quickstart (http://localhost:5000)
----------
    export FLASK_APP=/path/to/autoapp.py
    export FLASK_DEBUG=1

Then run the following commands to bootstrap your environment ::

    git clone https://github.com/otwn/flask-on-docker
    cd flask-on-docker
    pip install -r requirements.txt
    bower install
    flask run


Shell
-----

To open the interactive shell, run ::

    flask shell

By default, you will have access to the flask ``app``.


Running Tests
-------------

To run all tests, run ::

    flask test


Migrations
----------

Whenever a database migration needs to be made. Run the following commands ::

    flask db migrate

This will generate a new migration script. Then run ::

    flask db upgrade

To apply the migration.

For a full migration command reference, run ``flask db --help``.
