# Django Multilanguage Demo

Minimal demo showing Django internationalization + django-parler + django-rosetta.

## Features
- Django i18n + l10n enabled
- django-parler for model translations
- django-rosetta for in-browser translation editing
- Example apps: `language` (Category, Post)
- Locale files in `locale/`

## Prerequisites
- Python 3.9+
- pip
- Docker (optional)
- gettext (required for `compilemessages`)

## Local development (Windows)
1. Create venv and install:
   ```
   python -m venv .venv
   .venv\Scripts\activate
   pip install -r requirements.txt
   ```
2. Apply migrations:
   ```
   python manage.py migrate
   ```
3. Create superuser (to access admin / rosetta):
   ```
   python manage.py createsuperuser
   ```
4. Make/compile translations:
   ```
   python manage.py makemessages -l es
   # edit locale/<lang>/LC_MESSAGES/django.po
   python manage.py compilemessages
   ```
5. Run server:
   ```
   python manage.py runserver
   ```

## Docker (development)
Build and run (from project `src` folder):
```
docker build -t django-multilang .
docker run -p 8000:8000 --rm django-multilang
```
The container runs migrations and starts the dev server on 0.0.0.0:8000.

## Important settings
- Locale middleware enabled in `core/settings.py`
- `LANGUAGES` defined in settings
- `LOCALE_PATHS` set to `locale/`
- Parler configured via `PARLER_LANGUAGES`

## Notes
- Uses SQLite by default.
- If you add packages that require system libs, update Dockerfile accordingly.
- For production use, replace runserver with a WSGI server (gunicorn) and use a production-ready database.
