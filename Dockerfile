# Use the NVIDIA CUDA image as the base image
FROM huggingface/transformers-pytorch-gpu:4.19.4

# Set the working directory
WORKDIR /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Install Transformers
RUN pip install transformers --no-cache-dir

# Set the entry point
CMD ["python3", "app.py"]