# Usage

Installing Odoo 19 on Docker

* odoo19 @ `localhost:10019` (default master password: `odoo.dev`):
* odoo19-postgres @ `localhost:5432` (username `odoo` : password: `odoo19@2025`):
* odoo19-pgadmin @ `localhost:5050` (username `admin@example.com` : password: `admin`):

Start the container:
``` sh
docker-compose up
```

Then open `localhost:10019` to access Odoo 19.0


Run Odoo container in detached mode (be able to close terminal without stopping Odoo):

```
docker-compose up -d
```

**If you get the permission issue**, change the folder permission to access the directory:

``` sh
$ git clone https://github.com/STP5940/odoo-19-docker-compose
$ sudo chmod -R 777 addons
$ sudo chmod -R 777 etc
$ mkdir -p postgresql
$ sudo chmod -R 777 postgresql
```

# Custom addons

The **addons/** folder contains custom addons. Just put your custom addons if you have any.

# Odoo configuration & log

* To change Odoo configuration, edit file: **etc/odoo.conf**.
* Log file: **etc/odoo-server.log**
* Default database password (**admin_passwd**) is `odoo.dev`
* Please change password it @ [etc/odoo.conf#L60](/etc/odoo.conf#L60)

# Odoo container management

**Run Odoo**:

``` bash
docker-compose up -d
```

**Restart Odoo**:

``` bash
docker-compose restart
```

**Stop Odoo**:

``` bash
docker-compose down
```

# Live chat

In [docker-compose.yml#L25](docker-compose.yml#L25), we exposed port **20019** for live-chat on host.

Configuring **nginx** to activate live chat feature (in production):

``` conf
#...
server {
    #...
    location /longpolling/ {
        proxy_pass http://0.0.0.0:20019/longpolling/;
    }
    #...
}
#...
```

# docker-compose.yml

* odoo: 19.0
* postgres: 18
* pgadmin4: 9.8