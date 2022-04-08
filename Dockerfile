FROM python:3.10-alpine
  
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache \
            gcc \
            postgresql \
            musl-dev \
            libpq-dev

COPY requirements.txt /tmp/

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
                -r /tmp/requirements.txt \
                --no-cache-dir
