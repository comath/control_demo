# Use the NVIDIA CUDA image as the base image
FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-devel

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Install Transformers
RUN pip install transformers --no-cache-dir

# Set the entry point
CMD ["python", "app.py"]