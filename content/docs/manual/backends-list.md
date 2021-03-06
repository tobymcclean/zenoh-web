---
title: "List of backends"
weight : 2210
menu:
  docs:
    parent: manual
---


Here is the list of the available backends:

| Backend     | Description                                               | Github repo & doc                         |
|-------------|-----------------------------------------------------------|-------------------------------------------|
| Memory      | In-memory storages (simple hashmap)                       | [see below](#memory-backend)              |
| InfluxDB    | Storages in InfluxDB databases.                           | [eclipse-zenoh/zenoh-backend-influxdb]    |
| File System | Storages on local files system, each key/value in a file. | [eclipse-zenoh/zenoh-backend-filesystem]  |

[eclipse-zenoh/zenoh-backend-influxdb]: https://github.com/eclipse-zenoh/zenoh-backend-influxdb
[eclipse-zenoh/zenoh-backend-filesystem]: https://github.com/eclipse-zenoh/zenoh-backend-filesystem



-----------------
## **Memory Backend**

A backend storing paths/values into an in-memory hashmap.

The memory backend implementation is not provided by a backend library but is embeded within the [Storages plugin](../plugin-storages) itself.
It is automatically added at zenoh router startup (under `"/@/router/<router-id>/plugin/storages/backend/memory"` admin path)
unless the `--no-backend` argument is used (see [Storages plugin](../plugin-storages)'s startup arguments).

Note that memory storages can also be created at zenoh router startup using the `--mem-storage` argument
(see [Storages plugin](../plugin-storages)'s startup arguments).

-------------------------------
### **Examples of usage**

Using `curl` on the zenoh router to add storages (assuming the zenoh router was not started with `--no-backend` option):
```bash
# Add a storage on /demo/example/**
curl -X PUT -H 'content-type:application/properties' -d "path_expr=/demo/example/**" http://localhost:8000/@/router/local/plugin/storages/backend/memory/storage/example
```


-------------------------------
### **Properties for Backend creation**

  Not applicable (automatically created by the zenoh router at startup).

-------------------------------
### **Properties for Storage creation**

- **`"path_expr"`** (**required**) : the Storage's [Path Expression](../abstractions#path-expression)

-------------------------------
### **Behaviour of the backend**

Only 1 value per path is stored (the latest one).
If publications arrive un-ordered, the ones that are older than the stored one are ignored.

