# LogCatcher

![LogCatcher](https://image.ibb.co/ebiM2k/Screenshot_from_2017_06_18_21_30_24.png)

The simple tool for the realtime checking logs.

## Steps for the starting LogCatcher:

### Add a logfile location

_docker-compose.yml_

```dockerfile
volumes:
  - /home/user/apps/my_app/log:/log
```

### Add a logfile name

_config.json_

```apple js
{"appName":"MyApp", "logPath": "/log/staging.log"}
```

### Start the LogCatcher

```bash
docker-compose up
# flag -d for run as a daemon
# command 'stop' for stopping LogCatcher
```

That's all! We are on LogCatcher!

Open it on [http://localhost:8080](http://localhost:8080) or http://server_ip:8080 :herb:

#### If you use a NGINX as proxy you must use this config:

```
server {

  listen 80;
  server_name you-app-logs.com;
  access_log /var/log/nginx/azbooks-logviewer.log;

  location / {
    proxy_pass http://127.0.0.1:8080;
    # Uncomment for protect the LogCatcher. Read more https://goo.gl/WGTsLE
    # auth_basic "closed site";
    # auth_basic_user_file /etc/nginx/.htpasswd;
  }

  location /ws {
    proxy_pass http://127.0.0.1:8080;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    proxy_read_timeout 600s;
  }

}
```

Based on [LogViewer](http://jijeshmohan.github.io/logviewer/)