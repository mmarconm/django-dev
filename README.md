```powershell
docker compose pull

docker compose up -d --build

docker-compose run web django-admin startproject root .

docker-compose run web django-admin startapp core

docker-compose run web python manage.py collectstatic --noinput

docker compose restart nginx
```

```py
# settings.py

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
