# Dockerfile
FROM python:3.13-slim

# Instala las dependencias del sistema
RUN apt-get update && apt-get install -y gcc openssl libpq-dev

# Crea un directorio de trabajo
WORKDIR /app

# Copia el archivo de dependencias
COPY requirements.txt .

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código fuente al contenedor
COPY src src

# Exponer el puerto que FastAPI usará
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
