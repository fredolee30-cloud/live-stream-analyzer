# 直播文稿分析工具 - 后端服务

## 本地运行

```bash
# 安装依赖
pip install -r requirements.txt

# 运行服务
python app.py
```

服务会运行在 http://localhost:5000

## 部署到 Render/Railway

1. 把这个文件夹上传到 GitHub
2. 在 Render/Railway 创建新服务，连接 GitHub 仓库
3. 选择 Python 环境，自动安装 requirements.txt
4. 启动命令：`gunicorn app:app`

## API 接口

### POST /api/parse-file
上传文件并解析文本

**请求：**
- Content-Type: multipart/form-data
- Body: file (文件)

**响应：**
```json
{
  "success": true,
  "filename": "example.txt",
  "text": "解析后的文本内容",
  "length": 12345,
  "message": "成功解析 12345 字"
}
```

### GET /api/health
健康检查

**响应：**
```json
{
  "status": "ok",
  "message": "服务运行中"
}
```
