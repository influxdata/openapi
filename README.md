## Influx API Definitions

This repository contains [OpenAPI specifications](https://www.openapis.org/) for InfluxData's various services. It provides a common place for shared API elements that are referenced by more specific API definitions.

This repository is organized as follows:

```
.
├── contracts/              # contains the aggregated openapi definitions; the "source of truth"
|   └── svc/                # contains the aggregated openapi defnitions for each individual standalone service
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
    ├── cloud-priv.yml      # defines the "private" cloud api ('/api/v2private')
    ├── cloud.yml           # defines the full cloud api
    ├── cloud-diff.yml      # defines the cloud api minus common elements
    ├── common.yml          # defines the shared api elements (between cloud and oss)
    ├── oss.yml             # defines the full oss api
    ├── oss-diff.yml        # defines the oss api minus common elements
    └── svc-[service].yml   # defines an individual service api
```

When adding a service api definition, add the service specific components to a subdirectory inside `src/svc` and reference them from a file in `src` with a prefix `svc-`. This allows product api maintainers to copy the service-specific ("internal") paths and components into the respective api definition (cloud, cloud-priv, or oss) without modifying references.

### Notes:

There are some limitations to this work. It is important at this time to ensure any definitions consumable from our UI are compatible with, and consumable by [oats](https://github.com/influxdata/oats). One of the OpenAPI v3 compatible specifications `oats` cannot currently handle is the `servers` override, so we keep them in separate swagger files. This is exemplified in `cloud-priv.yml` and it's `servers` key; the major difference between `cloud-priv.yml` and `cloud.yml`.
