# Base image
FROM python:3.7

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file to the working directory
COPY requirements.txt /code/

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files to the working directory
COPY . /code/

# Install Nginx
RUN apt-get update && apt-get install -y nginx


# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy your Nginx configuration file
COPY nginx.conf /etc/nginx/sites-enabled/

# Expose the port that Django runs on (default is 8000)
EXPOSE 8001

# Set the command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

