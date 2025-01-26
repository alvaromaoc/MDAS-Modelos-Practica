echo "Running CHECK pipeline"

./gradlew clean build \
  -Dquarkus.container-image.build=false \
  -Dquarkus.container-image.push=false \
  -Dquarkus.openshift.deploy=false