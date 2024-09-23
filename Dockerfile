FROM python:3.10-alpine 
WORKDIR /smart_home
COPY . .
RUN pip install --no-cache-dir --upgrade -r requirements.txt
ENV TYPE_DB=sqlite3
ENV PG_NAME=my_db
ENV PG_USER=postgres
ENV PG_PASSWORD=postgres
ENV PG_HOST=127.0.0.1
ENV PG_PORT=5432
ENV DEBUG=False
RUN python manage.py makemigrations measurement
RUN python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
