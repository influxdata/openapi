#!/bin/sh

# Extracts tags for listing in x-tagGroups.
# Crude one-liner without YAML parsing.

export CUR_DIR=$(dirname "$0")

echo '=== OSS ==='
grep -A1 -e "tags:" -h $CUR_DIR/../contracts/ref/oss.yml | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $CUR_DIR/../src/oss/tmp_tags.yml
echo '=== Cloud ==='
grep -A1 -e "tags:" -h $CUR_DIR/../contracts/ref/cloud.yml | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $CUR_DIR/../src/cloud/tmp_tags.yml

