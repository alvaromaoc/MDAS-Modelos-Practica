environment="$1"

./gradlew clean build -Dquarkus.openshift.name="modelos-${environment}" \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.push=true \
  -Dquarkus.openshift.deploy=true