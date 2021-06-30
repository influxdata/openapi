# InfluxDB API Contracts

Refer to the [FAQs](../README.md#FAQs) for vocabulary definitions.

## "Public" APIs
| File | Description |
| -- | -- |
| [`cloud-diff.yml`](./cloud-diff.yml) | Defines the cloud specific api elements |
| [`cloud.yml`](./cloud.yml) | Defines the cloud api |
| [`common.yml`](./common.yml) | Defines the shared api elements (between cloud and oss) |
| [`managed-functions.yml`](./managed-functions.yml) | Defines the managed functions api |
| [`mapsd.yml`](./svc/mapsd.yml) | Defines the mapsd api |
| [`oss-diff.yml`](./oss-diff.yml) | Defines the oss specific api elements |
| [`oss.yml`](./oss.yml) | Defines the oss api |
| [`swaggerV1Compat.yml`](./swaggerV1Compat.yml) | Defines the V1 compatible api routes (manually maintained) |

## "Private" APIs
| File | Description |
| -- | -- |
| [`annotationd.yml`](./priv/annotationd.yml) | Defines the annotationd api |
| [`cloud-priv.yml`](./priv/cloud-priv.yml) | Defines the "private" cloud api ('/api/v2private') |
| [`flowd.yml`](./priv/flowd.yml) | Defines the flowd api |
| [`quartz-oem.yml`](./priv/quartz-oem.yml) | Defines the oem quartz api |
| [`unity.yml`](./priv/unity.yml) | Defines the unity api |

## "Internal" APIs
| File | Description |
| -- | -- |
| [`annotationd.yml`](./svc/annotationd.yml) | Defines the annotationd api |
| [`flowd.yml`](./svc/flowd.yml) | Defines the flowd api |
| [`managed-functions.yml`](./svc/managed-functions.yml) | Defines the managed-functions api |
| [`mapsd.yml`](./svc/mapsd.yml) | Defines the mapsd api |

## Convenience Definitions for Reference
| File | Description |
| -- | -- |
| [`cloud.yml`](./ref/cloud.yml) | Fully defines the cloud api |
| [`oss.yml`](./ref/oss.yml) | Fully defines the oss api |
