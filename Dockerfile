# Development Dockerfile for Django multilang demo
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

WORKDIR /app

# system deps (gettext needed for compilemessages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gettext \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# copy and install requirements
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

# copy project files
COPY . /app

# collect static (if configured) and run migrations + compile translations at container start
ENV DJANGO_SETTINGS_MODULE=core.settings
EXPOSE 8000

CMD python manage.py migrate --noinput \
    && python manage.py compilemessages || true \
    && python manage.py runserver 0.0.0.0:8000