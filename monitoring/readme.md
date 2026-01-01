# 📊 Docker-based Monitoring Stack Setup Guide

This document explains **step by step** how to set up a **complete server monitoring stack from scratch** using:

* Prometheus (metrics)
* Node Exporter (host metrics)
* cAdvisor (container metrics)
* Loki (logs backend)
* Promtail (log shipper)
* Alertmanager (alerts)
* Grafana (visualization)

The guide is written so that **anyone can follow it and bring everything up successfully.**

---

## 1️⃣ Prerequisites

### Server requirements

* Ubuntu
* Docker installed
* Docker Compose installed

### Verify

```bash
docker --version
docker compose version
```

---

## 2️⃣ Directory Structure (IMPORTANT)

The final directory structure should look like the tree below.
### Directory structure

```
monitoring/ "whatever-you-like".
├── docker-compose.yml
├── prometheus
│   ├── prometheus.yml
│   └── alerts.yml
├── alertmanager
│   └── alertmanager.yml
├── grafana
├── loki
│   └── loki-config.yml
├── loki-data
│   ├── chunks
│   ├── index
│   ├── cache
│   ├── compactor
│   └── wal
└── promtail
    └── promtail-config.yml
```

### Permissions (critical for Loki)

```bash
mkdir -p loki-data/{chunks,index,cache,compactor,wal}
chown -R 10001:10001 loki-data
chmod -R 755 loki-data
```

---

## 3️⃣ Start the Stack

```bash
docker compose up -d
```

Verify:

```bash
docker compose ps -a
```

All containers should be **Up**.

---

## 4️⃣ Verification Checklist

### Prometheus targets

```
http://SERVER_IP:9090/targets
```

All targets must be **UP**.

### cAdvisor metrics

```
http://SERVER_IP:8888/metrics
```

Must show metrics.

---

## 5️⃣ Grafana Setup

### Login

```
http://SERVER_IP:3000
```
These are the initial login credentials; change that accordingly.
* Username: `admin`
* Password: `admin`

### Add data sources

* Prometheus → `http://prometheus:9090`
* Loki → `http://loki:3100`
### Save & Test → ✅
---

## 6️⃣ Dashboard Import (Instant Visibility)

Import Grafana dashboard: ``Grafana → Dashboards → Import``

* **ID:** `21361`(Docker / cAdvisor)
* **ID:** `1860`(Node metrics)
* **ID:** `3662`(Prometheus stats)
* **ID:** `13639`(Loki logs)
* Data source: (Prometheus / Loki)


#### These are basic dashboards added; more can be found here [Grafana Dashboards](https://grafana.com/grafana/dashboards/)


## ✅ Current Status

* Prometheus scraping OK
* cAdvisor metrics visible
* Grafana dashboard showing data
* Loki running without permission issues


🎯 This setup is **production-grade for single-node Docker monitoring** and can be replicated easily by following this document.
