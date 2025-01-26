version="$1"
# Guard clause to ensure version is correctly formed with SemVer
if ! echo "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+(-SNAPSHOT)$'; then
    echo "Error: Invalid version '${version}'"
    exit 1
fi

echo "Running INTEGRATION pipeline"
echo "Creating version '${version}' and deploying it into 'develop' environment"

./gradlew clean build sonar \
  -Pversion="${version}" \
  -Dsonar.branch.name=develop \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.push=true \
  -Dquarkus.openshift.deploy=true \
  -Dquarkus.openshift.name=modelos-develop