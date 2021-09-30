from django import template

register = template.Library()

@register.filter
def slice_path(value):
    return str(value).replace("uploads/","")
