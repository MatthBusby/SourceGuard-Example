#Dockerfile
FROM python:3.7-buster

COPY . /VulnerableWebApp
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["/VulnerableWebApp/startup.sh"]