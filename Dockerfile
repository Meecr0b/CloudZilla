FROM python:3.5-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

EXPOSE 8000

RUN mkdir /srv/CloudZilla
WORKDIR /srv/CloudZilla

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python ./manage.py migrate

CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000" ]
