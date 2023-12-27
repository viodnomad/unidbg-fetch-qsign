FROM openjdk:17-slim

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
COPY bin /app/bin
COPY lib /app/lib
COPY txlib /app/txlib

# 设置命令
RUN chmod -R 777 /tmp
RUN chmod -R 777 /app
RUN sed 's/"key": ".*"/"key": "'"$KEY_VALUE"'"/' txlib/$TXLIB_VERSION/config.json > /app/txlib/$TXLIB_VERSION/config.json

# 运行
CMD bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION

# 暴露端口
EXPOSE 7860