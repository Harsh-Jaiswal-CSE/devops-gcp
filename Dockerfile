# Use a small Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt first and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Run Django with gunicorn server
CMD ["gunicorn", "hello_django.wsgi:application", "--bind", "0.0.0.0:8000"]
