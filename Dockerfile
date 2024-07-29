# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Define the command to run your application
CMD ["python", "app.py"]

# Expose a port (if your application uses one)
EXPOSE 5000
