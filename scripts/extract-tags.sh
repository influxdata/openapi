#!/bin/sh

# Extracts tags for listing in x-tagGroups.
# Crude one-liner without YAML parsing.

export CUR_DIR=$(dirname "$0")

echo '=== OSS ==='
grep -r -A1 -e "tags:" -h $CUR_DIR/../src/common/paths/** $CUR_DIR/../src/oss/paths/** | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $CUR_DIR/../src/oss/tmp_tags.yml
echo '=== Cloud ==='
grep -r -A1 -e "tags:" -h $CUR_DIR/../src/common/paths/** $CUR_DIR/../src/cloud/paths/** | grep -e "- " | awk '{$1=$1};1' | uniq | sort > $CUR_DIR/../src/cloud/tmp_tags.yml

