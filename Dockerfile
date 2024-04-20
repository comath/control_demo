# Use the official Python image as the base image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY cldm .
COPY ldm .
COPY app.py .

# Set the entry point
CMD ["python", "simplified_interface.py"]