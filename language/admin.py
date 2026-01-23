# from django.contrib import admin
# from .models import Post
# from parler.admin import TranslatableAdmin

# # Register your models here.

# admin.site.site_header = "Localization and Internationalization Admin"
# admin.site.site_title = "Localization and Internationalization Admin Portal"
# admin.site.register(Post, TranslatableAdmin)


from django.contrib import admin
from .models import Post, Category
from parler.admin import TranslatableAdmin


class OurAdminPanel(TranslatableAdmin):
    search_fields = ['category__translations__name__icontains',
                     'translations__title__icontains', 'translations__content__icontains']


admin.site.register(Post, OurAdminPanel)
admin.site.register(Category, TranslatableAdmin)
