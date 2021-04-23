#!/bin/sh

CONTRACTS=${CONTRACTS:-openapi/contracts}

for contract in $(find ${CONTRACTS} -iname *.yml | grep -v 'diff'); do
    echo "ensuring simple oats compatibility with: ${contract}..."
    /src/node_modules/.bin/oats "${contract}" > /dev/null || exit 1
done

## uncomment below to test against oats' currently generated routes
# TS=${TS:-ts}
# mkdir -p ${TS}

# /src/node_modules/.bin/oats ${CONTRACTS}/oss.yml > ${TS}/generatedRoutes.ts || exit 1

# cat > .prettierrc.json <<-"EOF"
# {
#   "singleQuote": true,
#   "semi": false,
#   "trailingComma": "es5",
#   "bracketSpacing": false
# }
# EOF

# /src/node_modules/.bin/prettier --config .prettierrc.json --write ${TS}/generatedRoutes.ts

# diff contracts/original-genRoutes.ts  contracts/generatedRoutes.ts
