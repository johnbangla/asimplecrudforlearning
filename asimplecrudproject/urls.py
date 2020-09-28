

from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView

from django.conf import settings
from django.conf.urls.static import static

# from simple_ajax.views import UserSignUpView, ValidateUsername
from crudapp.views import CreateCrudUser, CrudView, DeleteCrudUser, UpdateCrudUser

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # Front Page
    path('', TemplateView.as_view(template_name='frontpage.html')),

    # # Simple Ajax Example
    # path('simpleajax/', UserSignUpView.as_view(), name='simple_ajax'),
    # path('ajax/validate-username/', ValidateUsername.as_view(), name='simple_ajax_validate'),

    # Django Ajax CRUD Operations
    path('crud/', CrudView.as_view(), name='crud_ajax'),
    path('ajax/crud/create/', CreateCrudUser.as_view(), name='crud_ajax_create'),
    path('ajax/crud/delete/', DeleteCrudUser.as_view(), name='crud_ajax_delete'),
    path('ajax/crud/update/', UpdateCrudUser.as_view(), name='crud_ajax_update'),



] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)