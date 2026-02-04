# Script đẩy folder hg_img lên GitHub: https://github.com/bitababe/nicecityimg
# Chạy script này trong thư mục hg_img (đã cài Git).

$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/bitababe/nicecityimg.git"

# Chạy từ chính thư mục chứa script
Set-Location $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Chua cai Git. Tai tai: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path .git)) {
    Write-Host "Khoi tao Git repository..." -ForegroundColor Cyan
    git init
}

if (-not (git remote get-url origin 2>$null)) {
    Write-Host "Dang them remote origin..." -ForegroundColor Cyan
    git remote add origin $repoUrl
} else {
    git remote set-url origin $repoUrl
}

Write-Host "Dang add tat ca file..." -ForegroundColor Cyan
git add .

Write-Host "Dang commit..." -ForegroundColor Cyan
git commit -m "Initial commit: upload hg_img"

Write-Host "Dang push len GitHub (branch main)..." -ForegroundColor Cyan
git branch -M main
git push -u origin main

Write-Host "Xong! Kiem tra tai: https://github.com/bitababe/nicecityimg" -ForegroundColor Green
