FROM python:3.11-slim

WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY . .

# 创建数据目录
RUN mkdir -p uploads stored shares

# 暴露端口
EXPOSE 8000

# 启动命令
CMD ["gunicorn", "-b", "0.0.0.0:8000", "-w", "4", "app:app"]
