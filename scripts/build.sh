set -ex

npm run lintfix

rm -rf dist
tsc -p tsconfig.cjs.json
tsc -p tsconfig.json

cat > dist/cjs/package.json << EOF
{
    "type": "commonjs"
}
EOF

cat > dist/esm/package.json << EOF
{
    "type": "module"
}
EOF
