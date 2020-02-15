FROM python:latest

WORKDIR /
COPY . .

RUN pip install --upgrade pip
RUN pip install mkdocs

CMD ["mkdocs","serve"]

