#!/bin/sh

CONTRACTS=${CONTRACTS:-openapi/contracts}

TS=${TS:-ts}
GEN_TS=${GEN_TS:-}
DIFF_TS=${DIFF_TS:-}

if [ ! -z "$GEN_TS" ]; then
    mkdir -p ${TS}

    cat > .prettierrc.json <<-"EOF"
{
    "singleQuote": true,
    "semi": false,
    "trailingComma": "es5",
    "bracketSpacing": false
}
EOF

    [ ! -z "$DIFF_TS" ] && mkdir orig-ts
fi

for contract in $(find ${CONTRACTS} -iname *.yml | grep -v 'diff'); do
    echo "ensuring simple oats compatibility with: ${contract}..."
    if [ -z "$GEN_TS" ]; then
        /src/node_modules/.bin/oats "${contract}" > /dev/null || exit 1
    else
        gend=${TS}/$(basename ${contract//.yml/.ts})

        /src/node_modules/.bin/oats "${contract}" > ${gend} || exit 1

        /src/node_modules/.bin/prettier --config .prettierrc.json --write ${gend}

        if [ ! -z "$DIFF_TS" ]; then
            ## generate client codes from master and compare
            echo "diffing generated client from: ${contract}..."
            origd=orig-ts/$(basename ${contract//.yml/.ts})

            /src/node_modules/.bin/oats "https://raw.githubusercontent.com/influxdata/openapi/master/${contract#openapi/}" > ${origd} || continue

            /src/node_modules/.bin/prettier --config .prettierrc.json --write ${origd}

            diff ${origd} ${gend}
        fi
    fi
done
