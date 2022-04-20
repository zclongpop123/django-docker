FROM python:3.10-alpine
  
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache \
            gcc \
            linux-headers \
            musl-dev \
            libpq-dev \
            libffi-dev \
            postgresql

COPY requirements.txt /tmp/

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
                -r /tmp/requirements.txt \
                --upgrade pip \
                --no-cache-dir
