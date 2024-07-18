FROM python:3.12-slim

ENV APP_HOME / app

WORKDIR $APP_HOME

COPY pyproject.toml poetry.lock $APP_HOME/

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install

COPY . $APP_HOME
EXPOSE 3000

# Указываем команду для запуска приложения
CMD ["python", "bot.py"]