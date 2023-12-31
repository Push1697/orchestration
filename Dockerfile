# Use the official Ubuntu 20.04 image
FROM ubuntu:20.04

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY app.py phishing.pkl ./

# Expose the port that your application will run on
EXPOSE 8000

# Command to run your application
CMD ["uvicorn", "app:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]