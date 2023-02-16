FROM python:3
WORKDIR /usr/src/app
RUN apt update && apt upgrade -y && apt install mariadb-client -y && pip install django mysqlclient && mkdir static && apt clean
COPY django_tutorial/ script.sh /usr/src/app/
RUN chmod +x /usr/src/app/script.sh
ENV ALLOWED_HOSTS=*
ENV DB_HOST=bd_mariadb_django
ENV DB_USER=django
ENV DB_PASSWORD=django
ENV DB_NAME=django
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@example.com
CMD ["/usr/src/app/script.sh"]