# Influx API Definitions

[Jump to API contracts.](./contracts)

- [Influx API Definitions](#influx-api-definitions)
  - [Overview](#overview)
  - [FAQs](#faqs)
    - [What is an "internal" vs "external" API?](#what-is-an-internal-vs-external-api)
    - [What is a "private" vs "public" API?](#what-is-a-private-vs-public-api)
    - [Is the API versioned?](#is-the-api-versioned)
    - [What is a gateway?](#what-is-a-gateway)
    - [What is the flow of an external request?](#what-is-the-flow-of-an-external-request)
    - [What is the flow of an internal request?](#what-is-the-flow-of-an-internal-request)
    - [Why is the API spec maintained separately from the code?](#why-is-the-api-spec-maintained-separately-from-the-code)
    - [Other swagger definitions?](#other-swagger-definitions)
  - [How to use](#how-to-use)
    - [Prologue](#prologue)
    - [Example (consumer)](#example-consumer)
    - [Notes](#notes)
  - [How to contribute](#how-to-contribute)
    - [Guidelines](#guidelines)
    - [Add and update paths and operations](#add-and-update-paths-and-operations)
    - [Add and update service definitions](#add-and-update-service-definitions)
    - [What to do when Cloud and OSS diverge](#what-to-do-when-cloud-and-oss-diverge)
    - [Add tag content or describe a group of paths](#add-tag-content-or-describe-a-group-of-paths)

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

To learn how to add and update definitions, see [How to contribute](#how-to-contribute).

## FAQs

### What is an "internal" vs "external" API?

"Internal" API refers to a service API that is reachable directly (no gateway). A hypothetical example would be `taskd` talking directly to `queryd` without going through the gateway.
"External" API refers to the API that a gateway serves.

### What is a "private" vs "public" API?

"Private" API refers to an API that is not published in docs, requires some alternate method of auth (superuser token), a ui/quartz specific routes, or is not committing to stability.
"Public" API refers to a documented API used for normal use of the platform.

### Is the API versioned?

Since there is currently no code that supports API versioning, this repo will remain unversioned. Each swagger definition can define it's own api version, and consumers may test API changes on a branch, but until there is support for versioned APIs in code, we won't tag this repo.

### What is a gateway?

Gateway refers to the entry point into our platform (whether it be a reverse proxy or some other router).

### What is the flow of an external request?

[client] -> [gateway] -> [service]

- An external `client` makes a request for `/api/v2/thing`.
- `gateway` finds where to handle requests for `/thing` and forwards the request to that service.
- `service` then handles that request and responds to the client.

### What is the flow of an internal request?

[service] -> [service]

- A `service` running inside the platform makes a request to another platform `service` at `/thing`.
- `service` then handles that request and responds to the client (requesting `service`).

### Why is the API spec maintained separately from the code?

Although keeping the API spec "closer" to the implementing code (for example, in the same repository) might prevent drift between them, maintaining the service-specific ("internal") definitions in this repo provides the following benefits:

- Standard location: consumers aren't left wondering where they need to look for the current API contract of a service.
- Ease of access: given that many of the services are closed source, keeping the definitions in this public repo avoids the need for consumers to access private files.
- Simpler integration: integration of the service into the "external" API doesn't require updating the reference path.

### Other swagger definitions?

The goal of this repo is to not only provide a central, trusted location for consumers of our external APIs, but also to provide a re-usable means for service maintainers to easily maintain their service API definitions. **As repository adoption increases, we expect to remove duplicate definitions from our organization's codebase where appropriate, rather than provide API definitions in multiple locations.**

## How to use

### Prologue

Various tools can consume the OpenAPI specification and generate API client *libraries* for different programming languages.
A client *application* can then import a client library and interact with the API.
This repository, specifically the [`contracts`](./contracts/) directory, contains OpenAPI definitions to generate client libraries.
Similar to how [Go (golang)](https://go.dev/) has a standard library composed of smaller, single-purpose libraries, the contracts in this repo allow consumers to generate granular libraries that users can import as they need.

It is intended that an individual client library is generated for each service defined. `cloud` and `oss` definitions will continue to exist as monolithic definitions while we postpone splitting them up in order to preserve functionality. As this repository gains adoption, we would like to break subsets of the `cloud` and `oss` definitions into more granular services, such as `query`, `write`, and `tasks`.

These more specialized swagger definitions (similar to the `datasourcesd`, `mapsd`, and `managed-functions` definitions), will allow the creation of granular libraries. The creation of more granular client libraries will allow developers to avoid bloat in their applications while still preserving the ability to consume a library to perform any action against our full API. Again, this modular workflow is preferred and benefits developers by not mandating that they consume a single client library that supports the entire API surface area.

As the "InfluxDB API" evolves and eventually gets versioned, we can continue to provide complete API definitions in [`ref`](./contracts/ref/), while allowing each sub-service (write, query, tasks, etc.) to evolve on its own.

### Example (consumer)

The following example generates a `mapsd` client library for golang that consumers can use to interact with the `mapsd` service:

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

### Notes

There are some limitations to this work.
InfluxDB UI requires that the definitions it consumes be [oats](https://github.com/influxdata/oats)-compatible and oats-consumable.
For example, an OpenAPI v3-compatible specification that `oats` doesn't support is the `servers` override, so we maintain separate files for definitions that contain `servers` overrides.
This is exemplified in `cloud-priv.yml` and its `servers` key - the main difference between `cloud-priv.yml` and `cloud.yml`.

## How to contribute

To update and generate contracts, do the following:

1. Clone this repository (`influxdata/openapi`).
2. If you haven't already, [install and run Docker](https://docs.docker.com/get-docker/).
3. Review the [guidelines](#guidelines).
4. Edit [`src`](./src) files.
5. With Docker running, run `make generate-all` to generate new API contracts.
6. Commit the result, including the generated `./contracts` files, and create a pull request.

### Guidelines

Follow these guidelines to add and update specifications:

- [Add and update paths and operations](#add-and-update-paths-and-operations)
- [Add and update service definitions](#add-and-update-service-definitions)
- [What to do when Cloud and OSS diverge](#what-to-do-when-cloud-and-oss-diverge)
- [Add tag content or describe a group of paths](#add-tag-content-or-describe-a-group-of-paths)

### Add and update paths and operations

If you're adding or updating paths and operations (`get`, `post`, etc.), follow our [path template](./docs/templates/pathTemplate.yml) for `summary`, `description`, and `example` elements.

### Add and update service definitions

To add a service API definition, add the service specific components to a subdirectory inside `src/svc` and reference them from a file in `src` with the `svc-` prefix.
This allows product API maintainers to copy the service-specific ("internal") paths and components into the respective API definition (`cloud`, `cloud-priv`, or `oss`) without modifying references.
For more information on how to add a new service API definition, see [src/svc/README](./src/svc/README.md).

### What to do when Cloud and OSS diverge

For information on what to do when platform APIs drift, see [src/README](./src/README.md).

### Add tag content or describe a group of paths

Use OpenAPI `tags` to group related endpoints (OpenAPI *Paths*).
Documentation generators that consume the API can use tags to provide navigation and additional information.
API reference docs
([OSS](https://docs.influxdata.com/influxdb/latest/api/),
[Cloud](https://docs.influxdata.com/influxdb/cloud/api/))
use the following tag elements and vendor extensions:

- `tag` Tags element: renders endpoint (Path) groups and *trait tags* in navigation menus--for example, **Tasks**.
- `description` Tag field: describes related Paths and their common features.
- `x-traitTag: true` Tag field: instead of grouping paths, the tag renders a topical section that contains supplemental information about the API.
- `x-tagGroups` Root element: groups and sorts `tag` elements for navigation menus--for example, **Data I/O endpoints**.

To edit these elements, see the platform-specific files:

- `src/[platform]/tags.yml`
- `src/[platform]/tag-groups.yml`

For more information, see [influxdata/docs-v2 /api-docs README](https://github.com/influxdata/docs-v2/blob/master/api-docs/README.md).
