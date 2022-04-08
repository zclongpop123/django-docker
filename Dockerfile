FROM python:3.10-alpine
  
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache \
            gcc \
            postgresql \
            musl-dev \
            libpq-dev

RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip &&\
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install --no-cache-dir \
                redis \
                django-redis \
                psycopg2 \
                django==4.0
