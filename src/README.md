# When APIs Drift

Within this (`src`) directory, you will find all API resource definitions. OSS/Cloud specific resources are defined in the `src/oss` and `src/cloud` directories respectively. When a shared type drifts, it will need to be removed from `common` and placed into the resource type's directory within the platform (cloud/oss) specific directory. Caution should be exercised to avoid stale references in complex resource types.

If there was some cloud only changes to the `AddResourceMemberRequestBody` type, one would:
```sh
# copy the type to the platform where the type has changed
copy src/common/schemas/AddResourceMemberRequestBody.yml src/cloud/schemas/AddResourceMemberRequestBody.yml

# edit the type in the platform where the type has changed
$EDITOR src/cloud/schemas/AddResourceMemberRequestBody.yml

# copy the resources that reference the modified resource into the platform where
# the type has changed and update references as required.
# NOTE: ensure the related lines from `src/common/_TYPE.yml` are *removed* and added
# to each platform's definition file.
grep -rl 'AddResourceMemberRequestBody.yml'
# ** src/common/_schemas.yml # <- this is not to be moved, but should be edited
# src/common/paths/tasks_taskID_members.yml
# src/common/paths/dashboards_dashboardID_owners.yml
# src/common/paths/orgs_orgID_owners.yml
# src/common/paths/buckets_bucketID_members.yml
# src/common/paths/orgs_orgID_members.yml
# src/common/paths/telegrafs_telegrafID_owners.yml
# src/common/paths/buckets_bucketID_owners.yml
# src/common/paths/scrapers_scraperTargetID_owners.yml
# src/common/paths/dashboards_dashboardID_members.yml
# src/common/paths/telegrafs_telegrafID_members.yml
# src/common/paths/tasks_taskID_owners.yml
# src/common/paths/scrapers_scraperTargetID_members.yml

# ensure the drifted resource was completely migrated. in this example, the only change
# to `contracts/oss.yml` should be the relocation of definitions.
make generate-all && git diff contracts
```

## Updating Convenience Definitions

When bits of the whole api are split up into smaller swagger definitions for consumers, ensure the reference definitions accurately reflect the api available on the platform. Add the new swagger definition files to the appropriate places in [`reference.sh`](../scripts/reference.sh).
