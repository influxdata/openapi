# Influx API Definitions

[Jump to API contracts.](./contracts)

## Overview

This repository contains [OpenAPI specifications](https://www.openapis.org/) for InfluxData's various services. It provides a common place for shared API elements that are referenced by more specific API definitions.

This repository is organized as follows:

```
.
├── contracts/              # contains the aggregated openapi definitions; the "source of truth"
|   └── svc/                # contains the aggregated openapi internal api definitions for each individual standalone service
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
    ├── cloud.yml           # defines the cloud api
    ├── common.yml          # defines the shared api elements (between cloud and oss)
    ├── oss.yml             # defines the oss api
    ├── svc-[service].yml   # defines an individual service api
    ├── quartz-oem.yml      # defines the oem quartz api
    └── unity.yml           # defines the unity api
```

When adding a service API definition, add the service specific components to a subdirectory inside `src/svc` and reference them from a file in `src` with a prefix `svc-`. This allows product API maintainers to copy the service-specific ("internal") paths and components into the respective API definition (cloud, cloud-priv, or oss) without modifying references. For more information on how to add a new service api defnition, [look here](./src/svc/README.md). For information on what to do when the platform APIs drift, [look here](./src/README.md).

When changes are complete, simply run `make generate-all` (`docker` currently required) and commit the results to get the new API contracts.

### FAQs

#### "Internal" vs "External" API?
 - "Internal" API refers to a service API that is reachable directly (no gateway). A hypothetical example would be `taskd` talking directly to `queryd` without going through the gateway.
 - "External" API refers to the API that a gateway serves.

#### "Private" vs "Public" API?
 - "Private" API refers to an API that is not published in docs, requires some alternate method of auth (superuser token), a ui/quartz specific routes, or is not committing to stability.
 - "Public" API refers to a documented API used for normal use of the platform.

#### Versioning?
 - Since there is currently no code that supports API versioning, this repo will remain unversioned. Each swagger definition can define it's own api version, and consumers may test API changes on a branch, but until there is support for versioned APIs in code, we won't tag this repo.

#### Gateway?
 - Gateway refers to the entry point into our platform (whether it be a reverse proxy or some other router).

#### Flow of an external request?
 - [client] -> [gateway] -> [service]
   + An external `client` makes a request for `/api/v2/thing`.
   + `gateway` finds where to handle requests for `/thing` and forwards the request to that service.
   + `service` then handles that request and responds to the client.

#### Flow of an internal request?
 - [service] -> [service]
   + A `service` running inside the platform makes a request to another platform `service` at `/thing`.
   + `service` then handles that request and responds to the client (requesting `service`).

#### Location?
 - Logic states that the further the API spec is from the implementing code, the greater the potential drift between the two. There are several reasons the service specific ("internal") definitions are in this repo and not living next to the code they define. Primarily it comes down to standardization. By standardizing on where to locate all swagger definitions, consumers aren't left wondering where they need to look for the current API contract of a service. Another equally important reason is more technical. While it is possible to reference swagger components via URL (as opposed to local relative file), the fact that many of the services are closed source re-introduce the issue of consuming private swagger. Third slightly relates to the last reason, as it simplifies the integration of the service into the "external" API (no reference path update required).

#### Other swagger definitions?
 - The goal of this repo is to not only provide a central, trusted location for consumers of our external APIs, but also to provide a re-usable means for service maintainers to easily maintain their service API definitions. **As repository adoption increases, we expect to remove duplicate definitions from our organization's codebase where appropriate, rather than provide API definitions in multiple locations.**


## How to use:

#### Prologue:

From swagger, client *libraries* can be generated. From client libraries, generated or not, client *applications* can be created. This repository, specifically the [`contracts`](./contracts/) directory, contains swagger definitions to generate client libraries. In [Go (golang)](https://go.dev/), there is a standard library made up of a plethora of smaller, more granularly defined libraries. The contracts in this repo allow consumers to generate granular libraries so users don't have to import an entire library when they only need a portion of the utility.

It is intended that an individual client library is generated for each service defined. `cloud` and `oss` definitions will continue to exist as monolithic definitions while we postpone splitting them up in order to preserve functionality. As this repository gains adoption, we would like to break subsets of the `cloud` and `oss` definitions into more granular services, such as `query`, `write`, and `tasks`.

These more specialized swagger definitions (similar to the `datasourcesd`, `mapsd`, and `managed-functions` definitions), will allow the creation of granular libraries. The creation of more granular client libraries will allow developers to avoid bloat in their applications while still preserving the ability to consume a library to perform any action against our full API. Again, this modular workflow is preferred and benefits developers by not mandating that they consume a single client library that supports the entire API surface area.

As the "InfluxDB API" evolves and eventually gets versioned, we can continue to provide complete API definitions in [`ref`](./contracts/ref/), while allowing each sub-service (write, query, tasks, etc.) to evolve on its own.


#### Example (consumer):

If I were producing a golang client library for other consumers to use the `mapsd` service, I could do something like the following:

```sh
# prepare directory for generated library
mkdir -p /tmp/output

# generate golang library for mapsd (same pattern goes for any service or definition)
docker run --rm -v /tmp/output:/out -it swaggerapi/swagger-codegen-cli-v3 generate -i https://raw.githubusercontent.com/influxdata/openapi/master/contracts/mapsd.yml -l go -o /out/
```

The library is then ready for use in an application:
```go
import mapsd "<some-prefix>/mapsd/swagger"

...

  mapsd.NewAPIClient.GetMapboxToken(context.Background())
```

#### Example (producer):

Everything (nearly) in the `contracts` directory is generated and should not be edited manually. Running `make generate-all` after editing files in `src` should be sufficient to propagate the change.

### Notes:

There are some limitations to this work. It is important at this time to ensure any definitions consumable from our UI are compatible with, and consumable by [oats](https://github.com/influxdata/oats). One of the OpenAPI v3 compatible specifications `oats` cannot currently handle is the `servers` override, so we keep them in separate swagger files. This is exemplified in `cloud-priv.yml` and it's `servers` key; the major difference between `cloud-priv.yml` and `cloud.yml`.
