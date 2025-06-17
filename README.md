# Cytrix Proxy Setup

This guide will help you install and configure the Squid proxy for use with the Cytrix dashboard.

---

## Prerequisites

* A Linux server (tested on Ubuntu 22.04)
* Docker installed and running
* Root (sudo) access

---

## 1. Run the Setup Script

1. Place both `setup.sh` and `run.sh` in your working directory on the server.
2. From that directory, execute:

   ```bash
   sudo bash setup.sh
   ```

   This will install any dependencies and prepare the environment.

---

## 2. Launch the Proxy

Once setup completes, start the proxy container:

```bash
sudo bash run.sh
```

This will:

* Build the Docker image
* Launch a Squid container listening on port `2443`

---

## 3. Configure in Cytrix Dashboard

1. Open your browser and navigate to:

   ```
   https://{clientToken}.cytrix.io/dashboard/proxy
   ```

2. Click **Add Proxy** (or **New Proxy**) and enter:

   * **Name**: A friendly name for your proxy
   * **IP**: The public IP or hostname of your Docker host
   * **Port**: `2443` if not changed

3. Click **Check Connection** to verify that Cytrix can reach your proxy.

---

## 4. (Optional) Restrict to a Single Client IP

By default, the proxy allows all clients. To lock it down to just one IP:

1. Open the `squid.conf` file in your project directory.

2. Locate the ACL for clients:

   ```conf
   acl all_clients src 0.0.0.0/0
   ```

3. Replace it with your fixed IP (provided by Cytrix). For example:

   ```conf
   acl allowed_client src 203.0.113.45
   ```

4. Save the file and rebuild/restart:

   ```bash
   sudo bash run.sh
   ```

---

You're all set! Your Squid proxy will now forward traffic according to your configuration. If you run into any issues, please reach out to your Cytrix support contact for assistance.
