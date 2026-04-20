FROM python:3.10-slim
WORKDIR /app
COPY . .
# We use a known old version of a package to demonstrate Trivy finding a vulnerability
RUN pip install requests==2.20.0
CMD ["python3", "app.py"]
