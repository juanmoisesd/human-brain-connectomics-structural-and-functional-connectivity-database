# Use a base image with both Python and R
FROM rocker/tidyverse:4.3.3

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages

# Copy the rest of the application
COPY . .

# Create output directory
RUN mkdir -p figures

# Default command: run Python and R analysis
CMD ["sh", "-c", "python3 analysis/analysis.py && Rscript analysis/analysis.R"]
