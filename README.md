## Influx API Definitions

This repository contains [OpenAPI specifications](https://www.openapis.org/) for InfluxData's various services.

This repository is organized as follows:

```
.
├── contracts/              # contains the generated openapi definitions; the "source of truth"
├── scripts/                # contains various scripts to aid in the generation of the contracts
└── src/                    # contains the raw openapi definitions
    ├── cloud/              # contains cloud specific openapi definitions
    ├── common/             # contains openapi defitions common to oss and cloud
    |   ├── parameters/     # contains common modular parameter definitions
    |   ├── paths/          # contains modular path definitions common to oss and cloud
    |   ├── responses/      # contains common modular response definitions
    │   ├── schemas/        # contains common modular schema definitions
    |   ├── _parameters.yml # all parameters common to oss and cloud
    |   ├── _paths.yml      # all paths common to oss and cloud
    │   └── _schemas.yml    # all schemas common to oss anc cloud
    ├── oss/                # contains oss specific openapi definitions
    ├── services/           # contains service openapi definitions
    |   ├── [service]/      # contains service specific definitions; similar structure to 'common'
    |   └── service.yml     # defines the service api
    ├── cloud.yml           # defines the cloud api
    └── oss.yml             # defines the oss api

```
