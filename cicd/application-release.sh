environment="$1"
version="$2"

# Guard clause to ensure environment is one of the available
case "$environment" in
  release|hotfix)
    ;;
  *)
    echo "Error: Invalid environment '${environment}'"
    exit 1
    ;;
esac

# Guard clause to ensure version is correctly formed with SemVer
if ! echo "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
    echo "Error: Invalid version '${version}'"
    exit 1
fi

echo "Running RELEASE pipeline"
echo "Creating version '${version}' and deploying it into '${environment}' environment"

./gradlew clean build e2e \
  -Pversion="${version}" \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.push=true \
  -Dquarkus.openshift.deploy=true \
  -Dquarkus.openshift.name="modelos-${environment}"