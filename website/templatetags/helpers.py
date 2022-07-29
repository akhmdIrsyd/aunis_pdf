from django import template

register = template.Library()

@register.filter
def slice_path(value):
    return str(value).replace("uploads/","")

@register.filter
def po_number(value):
    return str(value).split("-")[-1]


@register.filter
def kon_number(value):
    s = str(value).split("-")[:3]
    listToStr = '-'.join([str(elem) for elem in s])
    return listToStr

@register.filter
def if_null(value):
    if(value):
        return value
    else:
        return "-"