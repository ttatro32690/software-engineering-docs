FROM python:latest

WORKDIR /
COPY . .

EXPOSE 8000

RUN pip install --upgrade pip
RUN pip install mkdocs

CMD ["mkdocs","serve"]

