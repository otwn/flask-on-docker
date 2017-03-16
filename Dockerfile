FROM tiangolo/uwsgi-nginx-flask:flask-python3.5
# If you're going to need to troubleshoot with vim
# RUN apt-get -y update && apt-get -y install vim

ADD requirements/prod.txt /tmp/requirements.txt 
RUN pip install -r /tmp/requirements.txt 

# Assuming you're in the directory
COPY . /app
COPY ./nginx.conf /etc/nginx/conf.d/

WORKDIR /app
EXPOSE 8000
