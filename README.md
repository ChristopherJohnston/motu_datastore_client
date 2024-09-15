# MOTU AVB Datastore Client

A python client to interface with a MOTU AVB interface's datastore API.

* For Datastore API, see [MOTU AVB Datastore API Docs](https://cdn-data.motu.com/downloads/audio/AVB/docs/MOTU%20AVB%20Web%20API.pdf)
* For OSC Reference, see [MOTU AVB OSC Reference](https://cdn-data.motu.com/downloads/audio/AVB/docs/OSC%20Quick%20Reference.pdf)

# Usage

```
from motu_datastore_client import DatastoreClient
import asyncio

client = DatastoreClient("http://localhost:8888")
task = asyncio.create_task(client.run(write_message))
await asyncio.wait([task])
```

# Example

```
make develop
make run
```

The "AVB Server" is the URI of the MOTU AVB device to which the service will connect and relay any datastore updates. For testing connectivity to a virtual MOTU AVB device, use my [MOTU Development AVB Server](https://github.com/ChristopherJohnston/motu_server) repository.