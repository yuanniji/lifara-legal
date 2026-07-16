# Lifara 历界 — 部署法律文档到 GitHub Pages
$ErrorActionPreference = "Stop"
$RepoName = "lifara-legal"

$gh = Get-Command gh -ErrorAction SilentlyContinue
if (-not $gh) {
  Write-Host "未找到 gh。请先安装 GitHub CLI: winget install GitHub.cli"
  exit 1
}

$auth = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
  Write-Host "请先在浏览器完成 GitHub 登录："
  gh auth login -h github.com -p https -w
}

$owner = gh api user -q .login
Write-Host "GitHub 用户: $owner"

if (-not (Test-Path ".git")) {
  git init -b main
  git add .
  git commit -m "Add Lifara legal pages for GitHub Pages"
}

$remoteUrl = "https://github.com/$owner/$RepoName.git"
$hasRemote = git remote get-url origin 2>$null
if (-not $hasRemote) {
  gh repo create $RepoName --public --source=. --remote=origin --push --description "Lifara legal documents"
} else {
  git push -u origin main
}

Write-Host "开启 GitHub Pages..."
gh api -X POST "repos/$owner/$RepoName/pages" -f build_type=legacy -f "source[branch]=main" -f "source[path]=/" 2>$null
if ($LASTEXITCODE -ne 0) {
  gh api -X PUT "repos/$owner/$RepoName/pages" -f build_type=legacy -f "source[branch]=main" -f "source[path]=/" 2>$null
}

$base = "https://$owner.github.io/$RepoName"
Write-Host ""
Write-Host "完成！约 1–3 分钟后可访问："
Write-Host "  首页:     $base/"
Write-Host "  隐私政策: $base/privacy.html"
Write-Host ""
Write-Host "请把 lifara-v54/constants/legal-links.ts 里的 LEGAL_BASE_URL 改为："
Write-Host "  $base"
