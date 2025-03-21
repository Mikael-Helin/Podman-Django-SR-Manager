FROM debian:bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/app

# Copy app code and entrypoint
COPY ./srmanager/ /opt/app/
COPY entrypoint.sh /entrypoint.sh

# Create and activate virtualenv, then install requirements
RUN python3 -m venv venv && \
    ./venv/bin/pip install --no-cache-dir --upgrade pip && \
    ./venv/bin/pip install --no-cache-dir -r requirements.txt && \
    chmod +x /entrypoint.sh

# Expose default Django port
EXPOSE 8000

# Use virtualenv Python to run server
ENTRYPOINT ["/entrypoint.sh"]