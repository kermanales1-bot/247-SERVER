# Usar una imagen base de Node.js con Chrome preinstalado para Puppeteer
FROM ghcr.io/puppeteer/puppeteer:latest

USER root

# Instalar FFmpeg en el sistema operativo de Render
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Configurar el directorio de trabajo
WORKDIR /app

# Copiar los archivos de tu servidor
COPY package*.json ./
RUN npm install

COPY . .

# Exponer el puerto que usa Render por defecto
EXPOSE 10000

# Comando para arrancar tu API
CMD ["node", "server.js"]
