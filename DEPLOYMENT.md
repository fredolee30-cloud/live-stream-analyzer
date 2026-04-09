# 直播文稿分析工具 - 快速部署指南

## 方案一：Vercel 部署（推荐，5 分钟上线）

### 步骤 1：上传到 GitHub

1. 访问 https://github.com
2. 登录/注册账号
3. 点击右上角 **+** → **New repository**
4. 填写：
   - Repository name: `live-stream-analyzer`
   - 选择 **Public**
5. 点击 **Create repository**

### 步骤 2：推送代码

在电脑上新建一个文本文件，命名为 `push.bat`，内容如下：

```batch
@echo off
cd /d C:\Users\yue.yuan\live-stream-analyzer
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/live-stream-analyzer.git
git push -u origin main
echo.
echo 推送完成！请关闭此窗口
pause
```

**注意：** 把 `YOUR_USERNAME` 改成你的 GitHub 用户名

然后双击运行 `push.bat`，会弹出窗口让你输入 GitHub 账号密码。

### 步骤 3：部署到 Vercel

1. 访问 https://vercel.com
2. 点击 **Continue with GitHub** 登录
3. 点击 **Add New Project**
4. 选择 `live-stream-analyzer` 仓库
5. 点击 **Deploy**
6. 等待 1-2 分钟，部署完成！

### 步骤 4：获取访问链接

部署完成后，你会看到一个链接，格式类似：
```
https://live-stream-analyzer-xxx.vercel.app
```

把这个链接发给你的同事，他们就能直接访问了！

---

## 方案二：Netlify Drop（无需 Git，拖拽上传）

1. 访问 https://app.netlify.com/drop
2. 把 `index.html` 文件拖到上传区域
3. 等待上传完成
4. 获得一个链接，例如：`https://yoursite.netlify.app`

**注意：** 这种方式每次更新都要重新拖拽文件。

---

## 方案三：Cloudflare Pages（免费，速度快）

1. 访问 https://pages.cloudflare.com
2. 登录/注册账号
3. 点击 **Create a project**
4. 连接 GitHub，选择你的仓库
5. 点击 **Deploy**

---

## 使用说明

### 同事如何使用

1. 打开你分享的链接
2. 输入他们自己的 Kimi API Key（从 https://platform.moonshot.cn 获取）
3. 粘贴文稿或上传文件
4. 点击"开始分析"

### 集中管理 API Key（可选）

如果你想让同事直接用，不用自己填 API Key：

1. 在 `index.html` 中找到这行：
   ```javascript
   const saved = localStorage.getItem('kimi_api_key');
   ```

2. 改成：
   ```javascript
   const saved = localStorage.getItem('kimi_api_key') || 'sk-your-api-key-here';
   ```

3. 重新部署

**注意：** 这样会暴露你的 API Key，建议让同事自己注册。

---

## 费用说明

| 服务 | 免费额度 | 说明 |
|------|---------|------|
| Vercel | 无限 | 个人项目完全免费，带宽 100GB/月 |
| Netlify | 100GB/月 | 免费套餐够用 |
| Cloudflare Pages | 无限 | 完全免费，带宽不限 |
| Kimi API | 需充值 | 按 token 计费，约 0.12 元/万字 |

---

## 常见问题

### Q: 部署后文件上传功能能用吗？
A: 不能。文件上传需要后端服务器支持。如果要用文件上传，需要额外部署后端（见下文）。

### Q: 只想让同事用，不想公开怎么办？
A: Vercel 可以设置密码保护：
1. 进入项目设置 → **Deployment Protection**
2. 开启 **Vercel Authentication**
3. 添加允许访问的邮箱

### Q: 访问速度慢怎么办？
A: 选择 Cloudflare Pages，国内访问速度更快。

---

## 进阶：部署后端（支持文件上传）

如果需要文件上传功能（Word/PDF 解析），需要部署后端：

### 部署到 Render.com

1. 访问 https://render.com
2. 注册/登录
3. New + → **Web Service**
4. 连接 GitHub 仓库
5. 配置：
   - **Root Directory**: `backend`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`
6. 部署完成后获得 API 地址
7. 在前端页面的"后端 API 地址"填入

---

## 快速开始

**最简单的流程：**
1. 注册 GitHub
2. 推送代码
3. 部署到 Vercel
4. 分享链接给同事

10 分钟内搞定！
