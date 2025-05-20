# Use an official Python runtime as a parent image
FROM python:2.7.16-alpine3.10

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages (gcc for twisted, 12.0.0 mentioned in source
RUN apk update && apk upgrade
RUN apk add build-base
RUN pip install twisted==12.0.0 --no-cache-dir
#RUN pip install --no-cache-dir -r requirements.txt

# Make port 1687 available to the world outside this container
EXPOSE 1687

# Define environment variable (optional)
#ENV NAME World

# Run hp.py when the container launches
CMD ["python", "./hp.py"]
