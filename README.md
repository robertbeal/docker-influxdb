# influxdb
Docker-ised Alpine ARM based version of InfluxDb

Example usage:

```
docker create \
	--name influxdb \
	--user $(id influxdb -u) \
	-p 8083:8083 -p 8086:8086 \
	-v /home/influxdb/.app:/config \
	-v /home/influxdb/.data:/data \
	-t robertbeal/influxdb:latest \
	influxd -config /config/config.toml
```
