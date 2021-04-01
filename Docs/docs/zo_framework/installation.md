### Requirements
- [mysql-async](https://github.com/brouznouf/fivem-mysql-async)
- Server Artifacts version +3325 (recommended)

### Installation

1. Put `zombieoutbreak` folder in your folder resources
2. Add the framework in your `server.cfg`
```cfg
ensure zombieoutbreak
```

It should look like this
```cfg
set mysql_connection_string "mysql://<USER>:<PASSWORD>@localhost/zombieoutbreak?charset=utf8mb4"

ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure rconlog
ensure baseevents
ensure mysql-async
ensure zombieoutbreak
```

3. Add database `zombieoutbreak.sql` to your server

!!! error
    If you have any problem with the installation or framework itself, let me know in [Issues](https://github.com/Dislaik/zombieoutbreak/issues)