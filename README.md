```powershell
docker compose pull

docker compose up -d --build

docker-compose run web django-admin startproject root .

docker-compose run web django-admin startapp core

docker-compose run web python manage.py collectstatic --noinput

docker compose restart nginx
```

```py
CSRF_TRUSTED_ORIGINS = ['http://localhost:8080']

STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'staticfiles'

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'
```
