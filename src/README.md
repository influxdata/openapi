# When APIs Drift

Within this (`src`) directory, you will find all API resource definitions. OSS/Cloud specific resources are defined in the `src/oss` and `src/cloud` directories respectively. When a shared type drifts, it will need to be removed from `common` and placed into the resource type's directoru under both `cloud` and `oss`. Moving from common is not strictly required, but immensely aids in ensuring there are no stale references, especially in more complex resource types.

For example if it there was some cloud only changes to the `AddResourceMemberRequestBody` type, one would
```sh
# move the original common definition to the platform where the type is unchanged
mv src/common/schemas/AddResourceMemberRequestBody.yml src/oss/schemas/AddResourceMemberRequestBody.yml

# copy the type to the platform where the type has changed
copy src/oss/schemas/AddResourceMemberRequestBody.yml src/cloud/schemas/AddResourceMemberRequestBody.yml

# edit the type in the platform where the type has changed
$EDITOR src/common/schemas/AddResourceMemberRequestBody.yml

# move and copy the resources that reference that resource into each platform, and
# update references as required.
# NOTE: rather than move the `src/common/_TYPE.yml` file, simply remove the related
# lines from that file and add to each platform's definition file.
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

# ensure the drifted resource was completely migrated
make generate-all && git diff

# move the unchanged resource back into common (required mainly for types used by other services)
# todo: make this standard
```
