# InfluxDB API Contracts

Refer to the [FAQs](../README.md#FAQs) for vocabulary definitions.

## "Public" APIs
[`cloud-diff.yml        # defines the cloud specific api elements`](./cloud-diff.yml)
[`cloud.yml             # defines the cloud api`](./cloud.yml)
[`common.yml            # defines the shared api elements (between cloud and oss)`](./common.yml)
[`managed-functions.yml # defines the managed functions api`](./managed-functions.yml)
[`oss-diff.yml          # defines the oss specific api elements`](./oss-diff.yml)
[`oss.yml               # defines the oss api`](./oss.yml)
[`swaggerV1Compat.yml   # defines the V1 compatible api routes (manually maintained)`](./swaggerV1Compat.yml)

## "Private" APIs
[`cloud-priv.yml # defines the "private" cloud api ('/api/v2private')`](./priv/cloud-priv.yml)
[`quartz-oem.yml # defines the oem quartz api`](./priv/quartz-oem.yml)
[`unity.yml      # defines the unity api`](./priv/unity.yml)

## "Internal" APIs
[`annotationd.yml # defines the annotationd api`](./svc/annotationd.yml)
[`flowd.yml       # defines the flowd api`](./svc/flowd.yml)
[`mapsd.yml       # defines the mapsd api`](./svc/mapsd.yml)
