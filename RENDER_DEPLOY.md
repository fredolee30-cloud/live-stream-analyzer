# Render 后端部署指南

## 概述

本文档说明如何将直播文稿分析工具的后端 API 部署到 Render。

## 部署步骤

### 第 1 步：准备 GitHub 仓库

1. 确保你的代码已推送到 GitHub：

```bash
cd C:\Users\yue.yuan\live-stream-analyzer
git add .
git commit -m "Add Render deployment configuration"
git push origin main
```

2. 如果还没有初始化 git，先运行：
```bash
git init
git add .
git commit -m "Initial commit"
# 然后在 GitHub 上创建仓库并关联
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

### 第 2 步：在 Render 上创建 Web Service

1. 访问 https://render.com 并登录/注册账号

2. 点击 **"New +"** → **"Web Service"**

3. 选择 **"Connect a repository"**

4. 找到你的 `live-stream-analyzer` 仓库，点击 **"Connect"**

5. 填写以下配置：

   | 配置项 | 值 |
   |--------|-----|
   | Name | `live-stream-analyzer-backend` |
   | Region | `Singapore` (新加坡，离中国较近) |
   | Branch | `main` |
   | Root Directory | (留空) |
   | Runtime | `Python` |
   | Build Command | `pip install -r requirements.txt` |
   | Start Command | `gunicorn app:app` |
   | Instance Type | `Free` |

6. 点击 **"Advanced"** 添加环境变量：

   | Key | Value |
   |-----|-------|
   | `PORT` | `10000` |
   | `PYTHON_VERSION` | `3.11.0` |
   | `RENDER_ENV` | `true` |

7. 点击 **"Create Web Service"**

### 第 3 步：等待部署完成

- Render 会自动开始构建和部署
- 大约需要 2-5 分钟
- 部署成功后，你会看到绿色对勾和访问 URL
- URL 格式类似：`https://live-stream-analyzer-backend-xxxx.onrender.com`

### 第 4 步：测试后端 API

在浏览器中访问：
```
https://你的服务名.onrender.com/api/health
```

应该看到：
```json
{"status": "ok", "message": "服务运行中"}
```

### 第 5 步：配置前端

打开 `index.html`，找到第 544 行左右：

```javascript
const BACKEND_URL = 'https://live-stream-analyzer-production.up.railway.app';
```

修改为 Render 的 URL：

```javascript
const BACKEND_URL = 'https://live-stream-analyzer-backend-xxxx.onrender.com';
```

### 第 6 步：部署前端

前端可以部署到 Netlify 或 Vercel：

#### 部署到 Netlify

1. 打开 https://app.netlify.com/drop
2. 把整个 `live-stream-analyzer` 文件夹拖到虚线框内
3. 等待上传完成
4. 获得访问链接

#### 部署到 Vercel

1. 访问 https://vercel.com
2. 导入 GitHub 仓库
3. 自动部署

---

## 环境变量说明

| 变量名 | 说明 |
|--------|------|
| `PORT` | Render 要求的端口号（10000） |
| `PYTHON_VERSION` | Python 版本 |
| `RENDER_ENV` | 标识运行在 Render 环境，启用内存存储 |

---

## 注意事项

### Render 免费版限制

1. **服务休眠**：15 分钟无访问后进入休眠，下次访问需要 30 秒唤醒
2. **存储限制**：磁盘是临时的，每次部署会清空
3. **内存存储**：代码已适配，使用内存存储文件和配置（重启后清空）

### 解决方案

- 前端 API Key 设置在浏览器本地存储，不依赖后端配置
- 文件上传功能在重启后会清空，适合临时使用
- 如需持久化存储，建议升级到 Render 付费版或使用外部数据库

---

## 常见问题

### Q: 部署后访问速度慢？
A: 选择新加坡区域（Singapore）可以获得较好的中国大陆访问速度。

### Q: 显示"服务暂时不可用"？
A: Render 免费版休眠后首次访问需要 30 秒唤醒时间，稍等即可。

### Q: 如何查看日志？
A: 在 Render 控制台 → Logs 标签页查看实时日志。

### Q: 如何更新代码？
A: 推送代码到 GitHub 后，Render 会自动重新部署。

---

## 成本估算

- **免费版**：$0/月（适合开发和测试）
- **标准版**：$7/月（移除休眠，增加性能）
- **Pro 版**：$20+/月（生产环境推荐）

---

## 部署检查清单

- [ ] 代码已推送到 GitHub
- [ ] Render Web Service 已创建
- [ ] 环境变量已配置
- [ ] 部署成功（绿色对勾）
- [ ] `/api/health` 接口返回正常
- [ ] 前端 `index.html` 已更新 Backend URL
- [ ] 前端已部署到 Netlify/Vercel
- [ ] 整体功能测试通过
