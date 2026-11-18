# Use an official lightweight Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy dependency list and install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the container
COPY . .

# Expose the port your app runs on (change 8000 if your app uses a different port, e.g., 5000 for Flask or 8501 for Streamlit)
EXPOSE 8000

# Command to run your app (update 'app:app' depending on your file and app instance name)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
