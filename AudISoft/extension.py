# add/extend django features
from django.http import HttpResponse
from datetime import datetime, time, date
from simplejson import dumps as json_encode
from numpy import int64

def default_json_encoder(o) :
    if isinstance(o, datetime):
        r = o.isoformat()
        if o.microsecond:
            r = r[:23] + r[26:]
        if r.endswith('+00:00'):
            r = r[:-6] + 'Z'
        return r
    elif isinstance(o, date):
        return o.isoformat()
    elif isinstance(o, time):
        if is_aware(o):
            raise ValueError("JSON can't represent timezone-aware times.")
        r = o.isoformat()
        if o.microsecond:
            r = r[:12]
        return r
    elif isinstance(o, int64):
        return int(o)
    else:
        raise TypeError(repr(o) + ' is not JSON serializable')

class JsonResponse(HttpResponse):
    def __init__(self, data, safe=True, **kwargs):
        if safe and not isinstance(data, dict):
            raise TypeError('In order to allow non-dict objects to be '
                'serialized set the safe parameter to False')
        kwargs.setdefault('content_type', 'application/json')
        data = json_encode(data, default=default_json_encoder)
        super(JsonResponse, self).__init__(content=data, **kwargs)