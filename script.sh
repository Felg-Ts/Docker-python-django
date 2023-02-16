#!/bin/bash

while ! mysql -u ${DB_USER} -p${DB_PASSWORD} -h ${DB_HOST}  -e ";" ; do
	sleep 1
done	

python3 /usr/src/app/manage.py migrate
python3 /usr/src/app/manage.py createsuperuser --noinput
python3 /usr/src/app/manage.py collectstatic --no-input
python3 /usr/src/app/manage.py runserver 0.0.0.0:5000