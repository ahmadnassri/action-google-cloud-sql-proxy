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
| key        | ✔️       | `-`             | Service Account JSON Key                                           |
| connection | ✔️       | `-`             | CloudSQL connection name                                           |
| port       | ✔️       | `-`             | _Listening port (MySQL: 3306, PostgreSQL: 5432, SQL Server: 1433)_ |
| version    | ❌        | `1.19.1-alpine` | CloudSQL Proxy Version                                             |
