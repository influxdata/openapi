#!/bin/sh

CONTRACTS=${CONTRACTS:-openapi/contracts}

/src/node_modules/.bin/oats ${CONTRACTS}/oss.yml > /dev/null || exit 1

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
