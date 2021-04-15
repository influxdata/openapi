# Influx API Definitions

## Overview

This repository contains [OpenAPI specifications](https://www.openapis.org/) for InfluxData's various services. It provides a common place for shared API elements that are referenced by more specific API definitions.

This repository is organized as follows:

```
.
├── contracts/              # contains the aggregated openapi definitions; the "source of truth"
|   └── svc/                # contains the aggregated openapi definitions for each individual standalone service
├── scripts/                # contains various scripts to aid in the generation of the contracts
└── src/                    # contains the raw openapi definitions
    ├── cloud/              # contains cloud specific openapi definitions
    ├── common/             # contains openapi definitions common to oss and cloud
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

When adding a service API definition, add the service specific components to a subdirectory inside `src/svc` and reference them from a file in `src` with a prefix `svc-`. This allows product API maintainers to copy the service-specific ("internal") paths and components into the respective API definition (cloud, cloud-priv, or oss) without modifying references. For more information, [look here](./src/svc/README.md). For information on what to do when the platform APIs drift, [look here](./src/README.md).

When changes are complete, simply run `make generate-all` (`docker` currently required) and commit the results to get the new API contracts.

### FAQs

"Internal" vs "External" API?
 - "Internal" API refers to a service API that is reachable directly (no gateway). A hypothetical example would be `taskd` talking directly to `queryd` without going through the gateway.
 - "External" API refers to the API that a gateway serves.

"Private" vs "Public" API?
 - "Private" API refers to an API that is not published in docs, requires some alternate method of auth (superuser token), a ui/quartz specific routes, or is not committing to stability.
 - "Public" API refers to a documented API used for normal use of the platform.

Versioning?
 - Since there is currently no code that supports API versioning, this repo will remain unversioned. Each swagger definition can define it's own api version, and consumers may test API changes on a branch, but until there is support for versioned APIs in code, we won't tag this repo.

Gateway?
 - Gateway refers to the entry point into our platform (whether it be a reverse proxy or some other router).

Flow of an external request?
 - [client] -> [gateway] -> [service]
   + An external `client` makes a request for `/api/v2/thing`.
   + `gateway` finds where to handle requests for `/thing` and forwards the request to that service.
   + `service` then handles that request and responds to the client.

Flow of an internal request?
 - [service] -> [service]
   + A `service` running inside the platform makes a request to another platform `service` at `/thing`.
   + `service` then handles that request and responds to the client (requesting `service`).

Location?
 - Logic states that the further the API spec is from the implementing code, the greater the potential drift between the two. There are several reasons the service specific ("internal") definitions are in this repo and not living next to the code they define. Primarily it comes down to standardization. By standardizing on where to locate all swagger definitions, consumers aren't left wondering where they need to look for the current API contract of a service. Another equally important reason is more technical. While it is possible to reference swagger components via URL (as opposed to local relative file), the fact that many of the services are closed source re-introduce the issue of consuming private swagger. Third slightly relates to the last reason, as it simplifies the integration of the service into the "external" API (no reference path update required).

### Notes:

There are some limitations to this work. It is important at this time to ensure any definitions consumable from our UI are compatible with, and consumable by [oats](https://github.com/influxdata/oats). One of the OpenAPI v3 compatible specifications `oats` cannot currently handle is the `servers` override, so we keep them in separate swagger files. This is exemplified in `cloud-priv.yml` and it's `servers` key; the major difference between `cloud-priv.yml` and `cloud.yml`.
