# Lifara 历界 · 法律文档（GitHub Pages）

静态页面，用于 App 内测 / 上架时填写隐私政策等 HTTPS 链接。

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
https://<你的GitHub用户名>.github.io/lifara-legal/privacy.html
```

内测填表「隐私政策 URL」用上面这条。
