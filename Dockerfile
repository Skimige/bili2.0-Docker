FROM python:3.8.2-alpine

MAINTAINER zsnmwy <szlszl35622@gmail.com>

ENV LIBRARY_PATH=/lib:/usr/lib

WORKDIR /app

RUN apk add --no-cache --virtual bili git build-base python-dev py-pip jpeg-dev zlib-dev && \
    git clone https://github.com/yjqiang/bili2.0.git /app && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man && \
    apk del bili && \
    apk add --no-cache libjpeg-turbo git

CMD git pull && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt && \
    python ./run.py
