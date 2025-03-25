# FastAPI Hello World on Kubernetes

這是一個簡單的 FastAPI 應用，透過 Docker 容器化，並可部署到 Kubernetes（如 K3s 或 GKE）上。

## 📦 需求

- Python 3.10+
- Docker
- Kubernetes（推薦使用 [k3s](https://k3s.io)）
- kubectl 已連接目標 Cluster

## 🚀 快速開始

### 1. 安裝套件（開發用）

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

