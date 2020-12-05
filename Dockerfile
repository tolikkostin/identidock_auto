FROM python:3.4
#FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
#RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1
RUN pip install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]
#CMD ["python", "identidock.py"]
