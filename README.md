# Django Multilanguage Demo

Purpose
-------
A minimal, practical example demonstrating how to add and manage multilingual support in a Django project. Shows:
- Django built-in i18n/l10n (translation strings, locale files)
- django-parler for model field translations
- django-rosetta for in-browser translation editing
- Example app (language: Category, Post) and simple templates

Quick features
--------------
- Locale files in locale/
- LANGUAGES + LocaleMiddleware configured
- Parler configured for model translations
- Rosetta available for translators (admin login required)
- Dockerfile for quick dev container

Prerequisites
-------------
- Python 3.9+
- pip
- gettext (required for `compilemessages`)
- Docker (optional)

Quick start — Windows
---------------------
1. Create and activate venv:
```
python -m venv .venv
.venv\Scripts\activate
```
2. Install dependencies:
```
pip install -r requirements.txt
```
3. Apply migrations:
```
python manage.py migrate
```
4. Create superuser (admin / rosetta):
```
python manage.py createsuperuser
```
5. Generate and compile translations:
```
python manage.py makemessages -l <lang_code>   # e.g. -l es
# edit locale/<lang_code>/LC_MESSAGES/django.po
python manage.py compilemessages
```
6. Run development server:
```
python manage.py runserver
```

Adding or changing languages
----------------------------
1. Add language to `core/settings.py` LANGUAGES (example):
```
LANGUAGES = [
  ('en', 'English'),
  ('es', 'Spanish'),
  ('de', 'German'),
  ('fr', 'French'),
  ('ar', 'Arabic'),
]
```
2. Update `PARLER_LANGUAGES` if you use parler for model translations.
3. Run `makemessages -l <code>`, edit `.po`, then `compilemessages`.
4. For model translations use the admin (ParlerAdmin) or Parler APIs to add translated records.

Rosetta (in-browser translation)
-------------------------------
- Ensure `rosetta` is in INSTALLED_APPS and migrations applied.
- Log in as superuser and visit `/rosetta/` to edit translations via UI.
- After edits, run `compilemessages` or use Rosetta export to regenerate .mo files if required.

Important settings notes
------------------------
- Ensure `LocaleMiddleware` is in MIDDLEWARE and placed after `SessionMiddleware` and before `CommonMiddleware`.
- `LOCALE_PATHS` should include the project `locale/` folder.
- `USE_I18N = True` and `USE_L10N = True` are enabled.

Docker (development)
--------------------
Build and run from project root:
```
docker build -t django-multilang .
docker run -p 8000:8000 --rm django-multilang
```
Container runs migrations and starts dev server on 0.0.0.0:8000.

Project layout (important files)
--------------------------------
- core/ — settings, urls, wsgi/asgi
- language/ — example app (models, views, templates)
- locale/ — translations (.po/.mo)
- templates/ — base, index, navbar
- requirements.txt, Dockerfile, README.md

Testing / verifying translations
--------------------------------
- After updating .po files run:
```
python manage.py compilemessages
```
- Restart server and switch site language via UI or language selector to verify strings and model translations.

Notes
-----
- Uses SQLite by default for demo.
- For production use a WSGI server (gunicorn), a production DB, proper static handling, and secure settings.
- Refer to django, django-parler and django-rosetta docs for advanced usage.

Contributing
------------
Fork, implement changes, open a PR. Keep translations accurate and run `compilemessages` before submitting changes.

License
-------
See repository LICENSE (or add one) for terms.
