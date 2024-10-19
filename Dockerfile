FROM python:3.9

# 安装FFmpeg
RUN apt-get update && apt-get install -y ffmpeg

# 将专案复制到容器中
COPY . /app
WORKDIR /app

# 安装必要的套件
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8080
CMD uvicorn main:app --host=0.0.0.0 --port=$PORT
