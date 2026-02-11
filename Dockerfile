FROM python:3.11-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

COPY src/api/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/api/ .
COPY models/trained/ models/trained/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
