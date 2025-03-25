FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .     # 先複製 requirements
RUN pip install -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
