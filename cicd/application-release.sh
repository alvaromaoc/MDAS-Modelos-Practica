environment="$1"
version="$2"

# Guard clause to ensure environment is one of the available
case "$environment" in
  integration|staging|hotfix|production)
    ;;
  *)
    echo "Error: Invalid environment '${environment}'"
    exit 1
    ;;
esac

# Guard clause to ensure version is correctly formed with SemVer
if ! echo "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+(-SNAPSHOT)?$'; then
    echo "Error: Invalid version '${version}'"
    exit 1
fi

echo "Creating version '${version}' and deploying it into '${environment}' environment"

./gradlew clean build \
  -Pversion="${version}" \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.push=true \
  -Dquarkus.openshift.deploy=true