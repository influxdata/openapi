# InfluxDB API Contracts

Refer to the [FAQs](../README.md#FAQs) for vocabulary definitions.

## "Public" APIs
```sh
cloud-diff.yml        # defines the cloud specific api elements
cloud.yml             # defines the cloud api
common.yml            # defines the shared api elements (between cloud and oss)
managed-functions.yml # defines the managed functions api
oss-diff.yml          # defines the oss specific api elements
oss.yml               # defines the oss api
swaggerV1Compat.yml   # defines the V1 compatible api routes (manually maintained)
```

## "Private" APIs
```sh
cloud-priv.yml # defines the "private" cloud api ('/api/v2private')
quartz-oem.yml # defines the oem quartz api
unity.yml      # defines the unity api
```

## "Internal" APIs
```sh
annotationd.yml # defines the annotationd api
flowd.yml       # defines the flowd api
mapsd.yml       # defines the mapsd api
```
