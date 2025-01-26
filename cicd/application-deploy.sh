version="$1"

# Guard clause to ensure version is correctly formed with SemVer
if ! echo "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+(-SNAPSHOT)?$'; then
    echo "Error: Invalid version '${version}'"
    exit 1
fi

echo "Running DEPLOY pipeline"
echo "Deploying version '${version}' into 'production' environment"

./gradlew clean build -x test \
  -Pversion="${version}" \
  -Dquarkus.container-image.build=false \
  -Dquarkus.container-image.push=false \
  -Dquarkus.openshift.deploy=true \
  -Dquarkus.openshift.name=modelos-production