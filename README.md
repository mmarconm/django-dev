# Django Dev Documentation

- To access django using nginx use `http://localhost:8080`
- To access django with django wsgi server use `http://localhost:8000`
- To access pgadmin4 db manager use `http://localhost:8081` email **admin@admin.home** and password **postgres**

## Docker compose
```sh
# Usefull commands for docker compose
docker compose pull
docker compose build --no-cache | docker compose up -d --build
docker-compose run web django-admin startproject root .
docker-compose run web django-admin startapp core
docker-compose run web python manage.py collectstatic --noinput
docker compose restart nginx
```

## Remote Containers
```sh
# Usefull commands for remote container in vscode.
# Will be like a normal linux machine with bash or sh terminal

mkdir static staticfiles media

django-admin startproject root .

python manage.py startapp core

python manage.py migrate
python manage.py collectstatic --no-input

python manage.py createsuperuser --username me --email admin@admin.home
```

## Configurations on settings.py
```py
# changes or add the configurations on settings.py as you needs.
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'django',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'db',
        'PORT': '5432',
    }
}

CSRF_TRUSTED_ORIGINS = ['http://localhost:8080']

STATIC_URL = "/static/"
STATIC_ROOT = BASE_DIR / 'staticfiles'
STATICFILES_DIRS = (
    BASE_DIR / 'static',
)

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'
```
