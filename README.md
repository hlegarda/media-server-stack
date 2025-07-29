# 🐳 Self-Hosted Media Server Stack

This repository contains Docker Compose setups for managing self-hosted media services including:

- **Plex** – media streaming server
- **Jellyfin** – open-source media server alternative to Plex
- **Navidrome** – lightweight self-hosted music server
- **Nginx Proxy Manager (NPM)** – reverse proxy with SSL support and admin UI

---

## 📁 Directory Structure

Each service has its own folder with an isolated `docker-compose.yaml` file and environment file. .env.example files are provided for your convenience.

```
servers/
├── jellyfin/
│   ├── docker-compose.yaml
│   └── .env
├── navidrome/
│   ├── docker-compose.yaml
│   └── .env
├── nginx-proxy-manager/
│   ├── docker-compose.yaml
│   └── .env
└── plex/
    ├── docker-compose.yaml
    └── .env
```

---

## ⚙️ Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- WSL2 (on Windows)

---

## 🚀 Running Services

All helper scripts assume you are in the root project directory:

### 🟢 Start All Services

```bash
./start_all.sh        # Linux/macOS/WSL
.\start_all.ps1       # Windows PowerShell
```

### 🔴 Stop All Services

```bash
./stop_all.sh         # Linux/macOS/WSL
.\stop_all.ps1        # Windows PowerShell
```

---

## 🌐 Public Access via Nginx Proxy Manager

You can expose services to the internet using [DuckDNS](https://www.duckdns.org/) and free SSL via Nginx Proxy Manager:

1. Set up your domain (e.g., `mynavidrome.duckdns.org`)
2. Point DuckDNS to your public IP
3. Add a Proxy Host in Nginx Proxy Manager (eg. port 8096 for Jellyfin)
4. Enable SSL and HTTP → HTTPS redirect

> **Note:** Make sure the port exposed in `docker-compose` (e.g., `8096:8096`) matches what you route in Nginx.

---

## 📡 Port Usage Summary

| Service   | External Port | Internal Port | Description           |
|-----------|---------------|---------------|-----------------------|
| Plex      | 32400         | 32400         | Web interface / TV    |
| Jellyfin  | 8096          | 8096          | Web interface / API   |
| Navidrome | 4533          | 4533          | Web and API access    |
| NPM UI    | 81            | 81            | Nginx Manager UI      |
| NPM Web   | 80/443        | 80/443        | Reverse Proxy HTTP/S  |

---

## 🔒 Security & Secrets

All secrets (e.g., API keys, Plex claims) are stored in `.env` files.

To avoid leaking them:

- Make sure your `.gitignore` includes:

```gitignore
.env
*/.env
```

- Do **not** hardcode sensitive environment variables in your YAML files.
- Replace any sensitive values with `${VARNAME}` and define them in the `.env`.

---

## 🛠️ Tips

- You don’t need `network_mode` unless you're doing special networking.
- Keep all `docker-compose.yaml` files isolated but structured consistently.
- Use the `.env` pattern to keep your repository clean and secure.

---

## 🤝 Contributing

Feel free to fork and adapt this stack for your own needs. PRs welcome for improvements, script enhancements, or service additions.

---

## 📃 License

This repository's helper scripts and configuration files are provided under the **MIT License**.

> ⚠️ **Note:** Each individual service (e.g., Jellyfin, Plex, Navidrome, Nginx Proxy Manager) is a separate project and is governed by its own license. Refer to their official documentation or GitHub repositories for detailed licensing information.

---
## 🎧 Why Self-Hosted Media?

I have a deep appreciation for music and film. Instead of relying on commercial streaming services, I prefer a more personal, permanent, and high-quality approach:

- I rip my own CDs and DVDs to ensure full control over audio/video quality, metadata, and format.
- My collection is curated with intention not dictated by licensing agreements or shifting catalogs.
- I avoid DRM and platform lock-in to enjoy media on my terms, without ads or compression artifacts.
- My setup supports multiple formats, custom libraries, and subtitles exactly how I want them.

> 🎵 I believe in **supporting your local shops**, whether it's independent record shops, used bookstores, or non chain movie retailers buying physical media helps preserve culture, supports small businesses, and gives you ownership that streaming services can't replicate.
