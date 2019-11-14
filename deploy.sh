set -e -x

# Sync the website
aws s3 sync $TRAVIS_BUILD_DIR/public s3://zenoh.rs --acl public-read --delete

# Create the redirect
aws s3api put-object --bucket zenoh.rs --key docs/index.html --website-redirect-location /docs/getting-started/hello-world --acl public-read

# Create a cloudfront invalidation
echo -n '{"Paths": {"Items": ["/*"], "Quantity": 1}, "CallerReference":"' >> payload.json &&
echo -n "travis-$(date)" >> payload.json &&
echo -n '"}' >> payload.json

# Submit the invalidation
~/.local/bin/aws cloudfront create-invalidation --invalidation-batch file://payload.json --distribution-id ELMMDTQCB9BNA