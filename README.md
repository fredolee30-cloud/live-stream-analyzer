# 直播文稿分析工具

基于 AI 的直播文稿分析工具，支持：
- ✅ 内容主题分析（宏观经济/科技资产）
- ✅ 合规性检测（承诺收益、预测涨跌、政治议题、推荐产品）
- ✅ 内容质量评估（逻辑完整性、说服力、数据详实度、案例质量）
- ✅ 导出 Word、PDF、复制摘要

---

## 使用方式

### 1. 配置 API Key

用文本编辑器打开 `index.html`，找到这一行（大约在第 532 行）：

```javascript
const KIMI_API_KEY = 'sk-your-api-key-here';
```

改成你的 Kimi API Key：

```javascript
const KIMI_API_KEY = 'sk-xxxxxxxxxxxxxxxxxxxxxxxx';
```

**获取 API Key：** https://platform.moonshot.cn/console/api-keys

### 2. 部署到云端（让同事能访问）

#### 方法 A：Netlify Drop（最简单，无需注册）

1. 访问 https://app.netlify.com/drop
2. 把 `index.html` 文件拖到上传区域
3. 获得一个链接，例如：`https://xxx-xxx.netlify.app`
4. 把链接分享给同事

#### 方法 B：Vercel（需要 GitHub）

1. 把代码推送到 GitHub
2. 访问 https://vercel.com
3. 导入仓库，自动部署
4. 获得链接：`https://xxx.vercel.app`

### 3. 本地使用

直接用浏览器打开 `index.html` 即可。

---

## 使用说明

1. **粘贴文稿**：将直播文稿粘贴到输入框
2. **点击分析**：等待几秒钟
3. **查看报告**：
   - 主题分析：宏观经济/科技资产占比
   - 合规检测：违规内容高亮显示
   - 质量评分：4 个维度评分
   - 改进建议：具体优化建议
4. **导出报告**：Word/PDF/复制摘要

---

## 模型选择

| 模型 | 支持字数 | 适用场景 |
|------|---------|---------|
| moonshot-v1-8k | ~8,000 字 | 短文稿、测试 |
| moonshot-v1-32k | ~30,000 字 | 正常直播文稿（推荐） |
| moonshot-v1-128k | ~120,000 字 | 超长文稿 |

---

## 费用说明

- **部署**：Vercel/Netlify 免费套餐足够使用
- **API**：Kimi API 按 token 计费，约 0.12 元/万字

---

## 注意事项

1. **不要公开分享带 API Key 的文件**：部署前确保 API Key 已经配置好
2. **文件上传功能**：需要后端服务器支持，当前版本仅支持粘贴文本
3. **浏览器兼容性**：推荐使用 Chrome/Edge 最新版

---

## 遇到问题？

- API 调用失败：检查 API Key 是否正确，账户余额是否充足
- 分析超时：文稿太长，尝试切换更大模型
- 部署后无法访问：检查网络连接，或换 Cloudflare Pages

---

## 更新日志

- 2024-xx-xx: 简化界面，移除 API 输入框，支持直接配置 API Key
