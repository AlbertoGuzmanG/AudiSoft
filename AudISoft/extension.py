# add/extend django features
from django.http import HttpResponse
import simplejson

def default_json_encoder(o) :
    if isinstance(o, datetime.datetime):
        r = o.isoformat()
        if o.microsecond:
            r = r[:23] + r[26:]
        if r.endswith('+00:00'):
            r = r[:-6] + 'Z'
        return r
    elif isinstance(o, datetime.date):
        return o.isoformat()
    elif isinstance(o, datetime.time):
        if is_aware(o):
            raise ValueError("JSON can't represent timezone-aware times.")
        r = o.isoformat()
        if o.microsecond:
            r = r[:12]
        return r
    else:
        raise TypeError(repr(o) + ' is not JSON serializable')

class JsonResponse(HttpResponse):
    def __init__(self, data, safe=True, **kwargs):
        if safe and not isinstance(data, dict):
            raise TypeError('In order to allow non-dict objects to be '
                'serialized set the safe parameter to False')
        kwargs.setdefault('content_type', 'application/json')
        data = simplejson.dumps(data, default=default_json_encoder)
        super(JsonResponse, self).__init__(content=data, **kwargs)