@echo off
echo ========================================
echo  直播文稿分析工具 - 一键部署到 GitHub
echo ========================================
echo.

cd /d C:\Users\yue.yuan\live-stream-analyzer

echo 正在初始化 git 仓库...
git init 2>nul || echo Git 已初始化

echo.
echo 正在添加文件...
git add .

echo.
echo 正在提交...
git commit -m "Deploy to Vercel"

echo.
echo 正在切换分支...
git branch -M main 2>nul

echo.
echo ========================================
echo  请在下方输入你的 GitHub 仓库地址
echo  格式：https://github.com/你的用户名/仓库名.git
echo ========================================
echo.
set /p repo_url="输入仓库地址："

git remote add origin %repo_url% 2>nul
git push -u origin main

echo.
echo ========================================
echo  推送完成！
echo.
echo 下一步：
echo 1. 访问 https://vercel.com
echo 2. 用 GitHub 账号登录
echo 3. 点击 "Add New Project"
echo 4. 选择你的仓库
echo 5. 点击 "Deploy"
echo ========================================
echo.
pause
