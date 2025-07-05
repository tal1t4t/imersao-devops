FROM python:3.13.5-alpine3.22



# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file first to leverage Docker's layer caching.
# This layer is only rebuilt if requirements.txt changes.
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's source code
COPY . .

# Expõe a porta que a aplicação FastAPI irá rodar (padrão é 8000)
EXPOSE 8000 

# Command to run the application when the container starts.
# We use 0.0.0.0 to make the server accessible from outside the container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
