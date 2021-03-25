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
    ├── svc/                # contains service openapi definitions
    |   └── [service]/      # contains service specific definitions; similar structure to 'common'
    ├── cloud-priv.yml      # defines the "private" cloud api (/api/v2private)
    ├── cloud.yml           # defines the cloud api
    ├── oss.yml             # defines the oss api
    └── svc-[service].yml   # defines an individual service api
```

When adding a service api definition, add the service specific components to a subdirectory inside `src/svc` and reference them from a file in `src` with a prefix `svc-`. This allows product api maintainers to copy the service-specific ("internal") paths and components into the respective api definition (cloud, cloud-priv, or oss) without modifying references.
