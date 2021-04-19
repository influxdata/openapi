# Adding a Service Definition

Within this (`src/svc`) directory, you will find resource definitions specific to individual services. These are contained in a directory for the service they apply to.

When defining a swagger file for a new service, start by creating the custom resource definitions in the respective subdirectory which correlates with swagger components: `parameters`, `paths`, `schemas`, `responses`, etc... The current file naming convention is to name the file what the component name was in swagger, with `.yml` as the extension. As path definitions are not compliant filenames, we'll need to convert `/` characters to `_` then drop `{}` characters (as well as the leading placeholder), finally append `.yml`.
```sh
echo "/variables/{variableID}.yml" | sed 's|[{}]||g; s|/|_|g; s|^_||g;'
# variables_variableID.yml
```

The contents of the yaml files should be the contents of the swagger definition (do not include the definition key itself). You may notice not all resource definition files are not completely left aligned, this is because the bulk of splitting the original mono swagger into separate files was done with some scripts which happened to preserve the extra leading tabs in most cases, these leading tabs are not required.

Any resource that references another resource will need to be written (or updated) to point to the file, rather than the local reference `#`.

```diff
< - $ref: "#/components/parameters/TraceSpan"
> - $ref: "./parameters/TraceSpan.yml"
```

Once the required resources are defined within the service's directory, the "internal" swagger definition may be created. This will define the api for communication directly with the service (assume no gateway or proxy is between the client and your service). Typically these internal service definitions only will vary from the "external" definition by the `servers` key in the swagger. This file should be created one directory up from here (`src`), and should be named `svc-[service_name].yml`, where `service_name` matches the directory here in `src/svc`.

This internal service definition file should reference the required paths and components previously created and can even reference any component within `src/common`.

```yml
openapi: 3.0.1
info:
  title: example service api
  version: 0.0.0
servers:
  - url: '/'
paths:
  /service/{serviceID}:
    $ref: "./svc/service_name/paths/service_serviceID.yml"
components:
  schemas:
    CustomThing:
      $ref: "./svc/service_name/schemas/CustomThing.yml"
    Error:
      $ref: "./common/schemas/Error.yml"
```

Following this structure will provide an easy method of including the service in a platform's (cloud/oss) api definition, as one would simply copy the definitions into the platform definition.

```diff
openapi: "3.0.0"
info:
  title: Influx Cloud API Service
  version: 2.0.1
servers:
  - url: /api/v2
paths:
  REF_COMMON_PATHS
>  # demo service api
>  /service/{serviceID}:
>    $ref: "./svc/service_name/paths/service_serviceID.yml"
components:
  schemas:
REF_COMMON_SCHEMAS
>    # demo service api
>    CustomThing:
>      $ref: "./svc/service_name/schemas/CustomThing.yml"
```

There is discussion around having large mono-swagger files that define an entire server's endpoints. The consensus seems to be that we should offer smaller defined sections of the API instead. Rather than copy the service definitions into the more general platform definition, simply update the [`generate.sh`](../../scripts/generate.sh) script to replace the server definition with whatever prefix the service will be accessible at through the gateway and generate a contract for general consumption in the proper context: "public" (`contracts/`) or "private" (`contracts/priv`).

```diff
> # flowd
> sed -e "s|^  - url: '/'|  - url: '/api/v2private'|" src/svc-flowd.yml > ./src/.svc.yml && \
> swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/priv/flowd.yml --type yaml && \
> rm src/.svc.yml
```

When complete, running `make generate-all` will re-compile the official swagger contracts.
