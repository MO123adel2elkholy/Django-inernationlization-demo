from django.contrib import admin
from .models import Post
# Register your models here.

admin.site.site_header = "Localization and Internationalization Admin"
admin.site.site_title = "Localization and Internationalization Admin Portal"
admin.site.register(Post)
