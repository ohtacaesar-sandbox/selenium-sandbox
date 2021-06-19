FROM python:3

ENV POETRY_HOME=/usr/local/lib/poetry

RUN set -eux \
  &&  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - \
  &&  ln -s /usr/local/lib/poetry/bin/poetry /usr/local/bin/ \
  &&  apt-get update \
  &&  apt-get install -y --no-install-recommends \
        chromium-driver \
        fonts-ipafont


WORKDIR /app

COPY . .

RUN set -eux \
  &&  poetry config virtualenvs.create false \
  &&  poetry install
