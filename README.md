# Google Cloud SQL Proxy

Run the Google Cloud SQL Proxy in a GitHub Action’s context

[![license][license-img]][license-url]
[![release][release-img]][release-url]

## Usage

### Prerequisites

- Running Cloud SQL instance with a public IP address
- Service Account with Role `Cloud SQL Client`

``` yaml
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

| input      | required | default  | description                                                        |
|------------|----------|----------|--------------------------------------------------------------------|
| key        | ✗        | `-`      | Service Account JSON Key                                           |
| token      | ✗        | `-`      | Service Account OIDC token (if using OIDC authentication)          |
| connection | ✓        | `-`      | Cloud SQL connection name                                          |
| port       | ✓        | `-`      | *Listening port (MySQL: 3306, PostgreSQL: 5432, SQL Server: 1433)* |
| version    | ✗        | `2.11.3` | Cloud SQL Proxy [Version][]                                        |
| sleep      | ✗        | `3`      | time between connection checks                                     |
| attempts   | ✗        | `10`     | number of total connection checks                                  |

> \[!NOTE\]  
> Note: One of `key` or `token` parameters or `GOOGLE_APPLICATION_CREDENTIALS` env var set is required for authentication.

  [Version]: https://github.com/GoogleCloudPlatform/cloudsql-proxy/releases

----
> Author: [Ahmad Nassri](https://www.ahmadnassri.com/) &bull;
> Twitter: [@AhmadNassri](https://twitter.com/AhmadNassri)

[license-url]: LICENSE
[license-img]: https://badgen.net/github/license/ahmadnassri/action-google-cloud-sql-proxy

[release-url]: https://github.com/ahmadnassri/action-google-cloud-sql-proxy/releases
[release-img]: https://badgen.net/github/release/ahmadnassri/action-google-cloud-sql-proxy
