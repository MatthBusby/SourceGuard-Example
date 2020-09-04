#Dockerfile
FROM python:3.7-buster

RUN mkdir /VulnerableWebApp
COPY . /VulnerableWebApp
 
WORKDIR /VulnerableWebApp/VulnerableWebApp

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["startup.sh"]
