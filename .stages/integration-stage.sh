./gradlew clean build \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.publish=true \
  -Dquarkus.openshift.deploy=true