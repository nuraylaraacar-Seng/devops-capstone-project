FROM python:3.11-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Bağımlılıkları kopyala ve kur
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama kodlarını kopyala
COPY service/ ./service/

# Güvenlik için non-root kullanıcı oluştur
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

# Uygulamanın çalışacağı port
EXPOSE 8080

# Servisi başlat
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
