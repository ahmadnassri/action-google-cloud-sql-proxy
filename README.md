# Google Cloud SQL Proxy

run the Google Cloud SQL Proxy in a GitHub Action's context

[![license][license-img]][license-url]
[![release][release-img]][release-url]
[![super linter][super-linter-img]][super-linter-url]
[![semantic][semantic-img]][semantic-url]

## Usage

### Prerequisites

-   Running Cloud SQL instance with a public IP address
-   Service Account with Role `Cloud SQL Client`

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

| input      | required | default         | description                                                        |
|------------|----------|-----------------|--------------------------------------------------------------------|
| key        | ✔️       | `-`             | Service Account JSON Key                                           |
| connection | ✔️       | `-`             | CloudSQL connection name                                           |
| port       | ✔️       | `-`             | *Listening port (MySQL: 3306, PostgreSQL: 5432, SQL Server: 1433)* |
| version    | ❌        | `1.19.1-alpine` | CloudSQL Proxy Version                                             |

----
> Author: [Ahmad Nassri](https://www.ahmadnassri.com/) &bull;
> Twitter: [@AhmadNassri](https://twitter.com/AhmadNassri)

[license-url]: LICENSE
[license-img]: https://badgen.net/github/license/ahmadnassri/action-google-cloud-sql-proxy

[release-url]: https://github.com/ahmadnassri/action-google-cloud-sql-proxy/releases
[release-img]: https://badgen.net/github/release/ahmadnassri/action-google-cloud-sql-proxy

[super-linter-url]: https://github.com/ahmadnassri/action-google-cloud-sql-proxy/actions?query=workflow%3Asuper-linter
[super-linter-img]: https://github.com/ahmadnassri/action-google-cloud-sql-proxy/workflows/super-linter/badge.svg

[semantic-url]: https://github.com/ahmadnassri/action-google-cloud-sql-proxy/actions?query=workflow%3Arelease
[semantic-img]: https://badgen.net/badge/📦/semantically%20released/blue
