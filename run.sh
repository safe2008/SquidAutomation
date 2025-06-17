docker build -t cytrixsquid .
docker rm -f cytrix-squid
docker run -d  --name cytrix-squid -p 2443:2443 cytrixsquid
