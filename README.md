# OTC CloudEye Prometheus Exporter
Prometheus exporter that gather metrics from Open Telekom Cloud resources over Cloud Eye API

### Needed Environment Variable
- REFRESH_TIME: Time that exporter wait's until gather metrics again, value in seconds (min 300)
- NAMESPACES: OTC Namespaces from which you want to get metrics (Example: DMS,ECS,RDS)
- PROJECT_ID: OTC Project ID
- TENANT_NAME: OTC Tenant Name
- USERNAME: OTC Username
- PASSWORD: OTC Password
- LOG_LEVEL: Exporter's log level (Example: WARNING, INFO, DEBUG)

### Docker Compose
``` yaml
version: '3'

services:
  otc-exporter:
    restart: always
    image: tiagoreichert/otc-cloudeye-prometheus-exporter
    ports:
      - "8000:8000"
    environment:
      - REFRESH_TIME=300
      - NAMESPACES=ECS,DMS
      - PROJECT_ID=<projectid>
      - TENANT_NAME=OTC-EU-DE-<tentantnumber>
      - USERNAME=foo
      - PASSWORD=bar
      - LOG_LEVEL=DEBUG
```

### TODO's
- Token validation