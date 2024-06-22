## Usage

### Prerequisites

- Running Cloud SQL instance with a public IP address
- Service Account with Role `Cloud SQL Client`

```yaml
on:
  push:
    branches: [ master ]

jobs:
  db-migrate:
    runs-on: ubuntu-latest

    steps:
      - uses: ahmadnassri/action-google-cloud-sql-proxy@v1
        with:
          key: ${{ secrets.cloud-sql-json-key }}
          connection: my-project:northamerica-northeast1:database
          port: 5432
```

### Inputs

| input      | required | default         | description                                                        |
| ---------- | -------- | --------------- | ------------------------------------------------------------------ |
| key        | ✗        | `-`             | Service Account JSON Key                                           |
| token      | ✗        | `-`             | Service Account OIDC token (if using OIDC authentication)          |
| connection | ✓        | `-`             | Cloud SQL connection name                                          |
| port       | ✓        | `-`             | _Listening port (MySQL: 3306, PostgreSQL: 5432, SQL Server: 1433)_ |
| version    | ✗        | `2.11.3`        | Cloud SQL Proxy [Version][version]                                 |
| sleep      | ✗        | `3`             | time between connection checks                                     |
| attempts   | ✗        | `10`            | number of total connection checks                                  |

[version]: https://github.com/GoogleCloudPlatform/cloudsql-proxy/releases

Note: One of `key` or `token` parameters or `GOOGLE_APPLICATION_CREDENTIALS` env var set is required for authentication.
