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

# 默认端口 5000（Railway 会使用 PORT 环境变量）
ENV PORT=5000

# 启动命令（读取 $PORT 环境变量）
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:$PORT -w 4 app:app"]
