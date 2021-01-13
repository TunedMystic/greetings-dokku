FROM python:3.9.1-alpine as base



FROM base AS base-build

RUN mkdir -p /opt/local

# Copy requirements and install.
COPY requirements.txt /tmp/
RUN pip install \
    --prefix=/opt/local \
    --disable-pip-version-check \
    --no-warn-script-location \
    -r /tmp/requirements.txt



FROM base AS final-build

# Install system dependencies.
RUN apk add --no-cache bash

# Copy requirements from builder image.
COPY --from=base-build /opt/local /opt/local

ENV APP_PATH=/app \
    PATH=/opt/local/bin:$PATH \
    PYTHONPATH=/opt/local/lib/python3.9/site-packages:/app/scout \
    PYTHONUNBUFFERED=1

WORKDIR $APP_PATH

# Copy application source.
COPY . $APP_PATH

EXPOSE 7000

CMD ["/app/bin/entrypoint.sh"]
