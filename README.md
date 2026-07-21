# 同领地 · 法律文档（GitHub Pages）

静态页面，用于 App 内测 / 上架时填写隐私政策与支持网址等 HTTPS 链接。

## 一键部署（Windows PowerShell）

在 **已安装 GitHub CLI 且已登录** 后，于本目录执行：

```powershell
.\deploy.ps1
```

首次登录 GitHub：

```powershell
gh auth login
```

按提示选：GitHub.com → HTTPS → Login with a web browser。

## 部署成功后的链接

```
支持网址:   https://<你的GitHub用户名>.github.io/tonglingdi-legal/
隐私政策:   https://<你的GitHub用户名>.github.io/tonglingdi-legal/privacy.html
```

App Store Connect 填表：
- **Support URL（支持网址）** → 首页链接
- **Privacy Policy URL（隐私政策）** → privacy.html 链接
