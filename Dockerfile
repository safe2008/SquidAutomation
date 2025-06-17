# 1. Start from a minimal Ubuntu
FROM ubuntu:22.04

# 2. Install Squid
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# 3. Copy your custom config in
COPY squid.conf /etc/squid/squid.conf

# 4. Expose the proxy port
EXPOSE 2443

# 5. Launch Squid in the foreground, logging at debug level 1
CMD ["squid", "-NYCd", "1", "-f", "/etc/squid/squid.conf"]
