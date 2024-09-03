FROM --platform=linux/amd64 python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt
RUN pip install gunicorn

# Copy project
COPY . /code/

# Run the Django development server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "djangodb.wsgi:application"]
