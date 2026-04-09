# 直播文稿在线分析工具 - 项目存档

**创建日期：** 2026-04-01  
**最后更新：** 2026-04-01  
**状态：** 已上线运行

---

## 📍 在线访问地址

**Netlify 部署链接：** https://iridescent-faun-5f7cfe.netlify.app

---

## 📁 项目文件位置

```
C:\Users\yue.yuan\live-stream-analyzer\
├── index.html          # 主页面（包含所有样式和脚本）
├── README.md           # 使用说明
├── DEPLOYMENT.md       # 部署指南
├── vercel.json         # Vercel 配置（可选）
└── deploy.bat          # 一键部署脚本（可选）
```

---

## 🛠️ 工具功能

| 功能 | 说明 |
|------|------|
| 内容主题分析 | 识别宏观经济/科技资产内容占比 |
| 合规检测 | 检测承诺收益、预测涨跌、政治议题、推荐产品等违规内容 |
| 质量评估 | 逻辑完整性、说服力、数据详实度、案例质量四维评分 |
| 导出报告 | 支持导出 Word、PDF 和复制摘要 |

---

## 🔧 技术配置

### 前端
- 纯 HTML + CSS + JavaScript（单文件）
- 使用 html2pdf.js 库导出 PDF

### AI 接口
- 服务商：Kimi (月之暗面)
- API 地址：`https://api.moonshot.cn/v1/chat/completions`
- 支持模型：
  - `moonshot-v1-8k`（约 8000 字）
  - `moonshot-v1-32k`（约 30000 字，推荐）
  - `moonshot-v1-128k`（约 120000 字）

### 部署平台
- **Netlify**（当前使用）
  - 免费套餐：100GB 带宽/月
  - 部署方式：手动拖拽上传

---

## 🚀 部署/更新步骤

### 首次部署（已完成）
1. 访问 https://app.netlify.com/
2. 登录账号
3. 点击 "Add new site" → "Deploy manually"
4. 拖拽 `live-stream-analyzer` 文件夹上传
5. 获得永久链接

### 后续更新代码
1. 在本地修改 `index.html`
2. 用浏览器打开测试
3. 重新登录 Netlify，进入你的站点
4. 点击 "Deploys" → "Deploy manually"
5. 再次拖拽文件夹上传覆盖

---

## ⚙️ 本地调试方法

### 直接打开测试
```
双击 index.html 用浏览器打开
```

### 修改 API Key 配置
代码位置：`index.html` 第 470-485 行

```javascript
// 保存 API Key 到本地存储
function saveApiKey() {
    const apiKey = document.getElementById('apiKeyInput').value.trim();
    // ...
}
```

### 修改分析提示词
代码位置：`index.html` 第 807-873 行

```javascript
function buildAnalysisPrompt(script) {
    // 在此处修改 AI 分析的提示词
    return `你是一位专业的直播内容分析专家...`;
}
```

### 修改 API 调用
代码位置：`index.html` 第 876-935 行

```javascript
async function callKimiAPI(apiKey, prompt) {
    const url = 'https://api.moonshot.cn/v1/chat/completions';
    // ...
}
```

---

## 📝 修改记录

| 日期 | 修改内容 | 操作人 |
|------|----------|--------|
| 2026-04-01 | 添加 API Key 输入框功能（支持用户自行输入） | - |
| 2026-04-01 | 部署到 Netlify，获得永久访问链接 | - |

---

## 🔑 API Key 获取

使用者需要自行获取 Kimi API Key：

1. 访问：https://platform.moonshot.cn/console/api-keys
2. 注册/登录账号
3. 创建 API Key
4. 复制到工具中使用

**计费标准：** 约 0.12 元/万字

---

## ⚠️ 注意事项

1. **API Key 安全**：API Key 保存在用户浏览器本地，不会上传到任何服务器
2. **部署更新**：每次修改代码后需要重新上传到 Netlify 才能生效
3. **缓存问题**：使用者可能需要清除浏览器缓存才能看到最新版本
4. **文件上传**：当前版本仅支持粘贴文本，不支持直接上传 Word/PDF 文件

---

## 📋 待办/改进建议

- [ ] 支持 Word/PDF 文件上传（需要后端支持）
- [ ] 添加历史记录功能
- [ ] 支持批量分析
- [ ] 添加更多 AI 模型选择（DeepSeek、通义千问等）

---

## 🔗 相关链接

| 名称 | 链接 |
|------|------|
| Netlify 控制台 | https://app.netlify.com/ |
| Kimi 开放平台 | https://platform.moonshot.cn/ |
| Kimi API 文档 | https://platform.moonshot.cn/docs |
| html2pdf.js 文档 | https://github.com/eKoopmans/html2pdf.js |

---

## 💡 常见问题

### Q: 部署后访问速度慢怎么办？
A: 可以切换到 Cloudflare Pages，国内访问速度更快。

### Q: 如何限制只有同事能访问？
A: 在 Netlify 站点设置中开启 "Password Protection"，设置访问密码。

### Q: 分析失败/超时而怎么办？
A: 检查 API Key 是否正确、账户余额是否充足；文稿太长时切换更大的模型。

### Q: 如何查看 Netlify 部署日志？
A: 登录 Netlify → 进入站点 → 点击 "Deploys" → 查看最新部署详情。

---

**存档完成时间：** 2026-04-01
