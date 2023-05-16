import logging

logger = logging.getLogger(__name__)

class RequestCountMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        self.request_count = 0

    def __call__(self, request):
        self.request_count += 1
        logger.info(f"Request #{self.request_count} received on port {request.META.get('SERVER_PORT')}")

        response = self.get_response(request)

        return response
