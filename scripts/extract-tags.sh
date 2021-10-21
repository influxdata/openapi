#!/bin/sh
set -e

# Extracts tags for listing in x-tagGroups.
# Crude one-liner without YAML parsing.

export CUR_DIR=$(dirname "$0")

oss_tags=$CUR_DIR/../src/oss/tmp_tags.yml
cloud_tags=$CUR_DIR/../src/cloud/tmp_tags.yml

grep -A1 -e "tags:" -h $CUR_DIR/../contracts/ref/oss.yml | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $oss_tags 
echo "OSS: $oss_tags"
grep -A1 -e "tags:" -h $CUR_DIR/../contracts/ref/cloud.yml | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $cloud_tags 
echo "Cloud: $cloud_tags"
