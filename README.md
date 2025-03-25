# FastAPI Dev + Deploy with DevSpace

這是一個使用 FastAPI + Docker + Kubernetes 的開發部署專案，透過 DevSpace 快速進行本地開發同步與部署至 VPS（MicroK8s）。

---

## 📦 技術棧

- FastAPI
- Docker
- Kubernetes (MicroK8s)
- DevSpace CLI v6.3.15
- NodePort 曝露對外服務

---

## 📁 專案結構

├── Dockerfile 
├── fastapi-deployment.yaml 
├── fastapi-service.yaml 
├── devspace.yaml 
├── main.py 
├── requirements.txt


---

## ⚙️ 環境前置

### 🐋 安裝 DevSpace CLI（v6.3.15）

請參考 [DevSpace Releases](https://github.com/devspace-sh/devspace/releases) 下載對應平台版本，並放置於 `/usr/local/bin`。

```bash
devspace version
# DevSpace version : 6.3.15

## 確保你有 MicroK8s kubeconfig 設定好：
export KUBECONFIG=~/.kube/config-vps


🚀 初次部署步驟
1️⃣ 建立固定的 NodePort Service（只做一次）

KUBECONFIG=~/.kube/config-vps devspace run deploy-service-once
這會建立對外連線的 NodePort（例如 30090），避免每次部署重新佔用 port。

2️⃣ 部署 FastAPI 並進入 Dev 模式

KUBECONFIG=~/.kube/config-vps devspace dev
同步本機檔案（hot reload）

對外開放 port：本地 localhost:8080 連接 container 的 80 port

容器內自動執行：uvicorn main:app --host 0.0.0.0 --port 80 --reload

🧪 測試你的 API
本地測試（port-forward）：


http://localhost:8080
遠端測試（例如 VPS IP：43.228.217.97）：


http://43.228.217.97:30090
🔁 重新部署 / 更新 Image 流程
當你有新修改或新建 Docker Image 時，只需：


KUBECONFIG=~/.kube/config-vps devspace dev
它會：

自動 build + push image

套用最新 Deployment 到 Kubernetes

不中斷地滾動更新服務

🔧 可用指令

# 第一次部署 Service
devspace run deploy-service-once

# 開發 & 熱更新同步
devspace dev

# 重新啟動 Deployment（可選）
devspace run restart-app
🧹 TODO（可加強）
加入 ingress.yaml 支援域名解析

自動化部署 GitHub Actions 整合

Profile 支援 dev / prod 環境切換