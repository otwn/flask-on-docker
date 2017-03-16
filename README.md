A Flask template on Docker with uWSGI & Nginx
=============================================
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
```
conda create -n py35env python=3.5
source activate py35env
git clone https://github.com/otwn/flask-on-docker
cd flask-on-docker
pip install -r requirements.txt
bower install
```

Then run the following commands
```
export FLASK_APP=/path/to/autoapp.py
export FLASK_DEBUG=1
flask run
```
![localhost5000](https://tamucs-my.sharepoint.com/personal/shinichi_tamu_edu/_layouts/15/guestaccess.aspx?docid=156f3371c34a94f5083f877b805d3639e&authkey=AdUXvbrGSLr7LOsRkxM_rt0 "localhost:5000")


Quickstart (http://localhost:8000)
----------
The same flask application will run on docker in port 8000.

```
./init_docker.sh
```    
![localhost8000](https://tamucs-my.sharepoint.com/personal/shinichi_tamu_edu/_layouts/15/guestaccess.aspx?docid=1a343b9f418224de18546fd74731a712e&authkey=AUJ7D2ZTthnt8XaYhiHn9VU "localhost:8000")


Configuration
=====

1. Access MongoDB on "host" machine from Docker.

Pymongo is installed and added pymongo settings on main/public/views.py. Change MONGODB_HOST. It should be your host machine's ip address.
```python
# MongoDB Connection
from pymongo import MongoClient
import json
from bson import json_util
from bson.json_util import dumps

MONGODB_HOST = 'Your Host IP address'
MONGODB_PORT = 27017

def get_db():
    c = MongoClient(MONGODB_HOST, MONGODB_PORT)
    return c.yourdatabase
```

2. Run Apache on Host and access the flask app on Docker by ProxyPass
- Apache 2.4 proxy.conf
```
ProxyPreserveHost On
<Proxy *>
  Require all granted
</Proxy>

ProxyPass /flask/ http://localhost:8000/
ProxyPassReverse /flask/ http://localhost/flask/
```
We can show the Flask app on Docker via proxy.

![localhost/flask](https://tamucs-my.sharepoint.com/personal/shinichi_tamu_edu/_layouts/15/guestaccess.aspx?docid=1fca520326df34355869d628e8d532ce3&authkey=AZB3Dtb7Yo_dwQ5LV65ntLk "localhost/flask")


Troubleshooting
=====
+ 403 Forbidden - Check permission of a directory/file
+ 502 Bad Gateway - Check a file name. The difference jQuery/ and jquery/ would show 502 error.
