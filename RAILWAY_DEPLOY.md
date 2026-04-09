# Railway 部署指南

## 前置准备

1. 拥有 GitHub 账号
2. 拥有 Railway 账号（访问 https://railway.app）

## 部署步骤

### 步骤 1：推送代码到 GitHub

```bash
# 进入项目目录
cd C:\Users\yue.yuan\live-stream-analyzer

# 初始化 git（如果还没有）
git init

# 添加所有文件
git add .

# 创建提交
git commit -m "Initial commit"

# 创建 GitHub 仓库并推送
# 访问 https://github.com/new 创建新仓库，例如：live-stream-analyzer
# 然后按提示推送：
git remote add origin https://github.com/你的用户名/live-stream-analyzer.git
git branch -M main
git push -u origin main
```

### 步骤 2：在 Railway 上部署

1. 访问 https://railway.app 并登录
2. 点击 **"New Project"**
3. 选择 **"Deploy from GitHub repo"**
4. 选择你刚才创建的仓库 `live-stream-analyzer`
5. Railway 会自动检测 `backend/Dockerfile` 并部署

### 步骤 3：配置环境变量

在 Railway 项目页面：
1. 点击 **"Variables"**
2. 添加以下环境变量（可选，因为 API Key 可以通过后端 API 配置）：
   - `KIMI_API_KEY`: 你的 Kimi API Key
   - `DEFAULT_MODEL`: `moonshot-v1-32k`

### 步骤 4：获取部署地址

部署完成后，Railway 会给你一个公网地址，例如：
```
https://live-stream-analyzer-production.up.railway.app
```

### 步骤 5：配置前端 API 地址

修改 `index.html`，找到后端 API 地址配置（需要添加）：
```javascript
const BACKEND_API_URL = 'https://live-stream-analyzer-production.up.railway.app';
```

或者在界面上添加一个配置项让用户自行输入后端地址。

## 费用说明

Railway 提供：
- 免费试用额度（$5 或 500 小时运行时间）
- 付费计划：$5/月起

对于小规模使用，免费额度应该足够。

## 本地测试后端

在部署前，建议先在本地测试后端服务：

```bash
cd backend

# 安装依赖
pip install -r requirements.txt

# 启动服务
python app.py

# 访问 http://localhost:5000/api/health
```

## 常见问题

### Q: 部署后无法访问？
A: 检查 Railway 控制台日志，查看是否有启动错误。

### Q: 文件存储在哪里？
A: 文件存储在 Railway 的临时文件系统中，重启后会丢失。如果需要持久化存储，需要配置 Railway 的 Volume 或使用外部存储（如 AWS S3）。

### Q: API Key 安全吗？
A: 通过后端配置 API Key 比前端更安全，因为不会暴露在浏览器中。
