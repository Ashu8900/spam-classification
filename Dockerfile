FROM python:3.8-bullseye
COPY . /spam_classification
WORKDIR /spam_classification
RUN pip3 install -r requirements.txt
RUN useradd --create-home dev
USER dev
RUN python3 -c "import nltk; nltk.download('punkt'); nltk.download('stopwords')"
ENTRYPOINT [ "streamlit", "run", "app.py" ]
