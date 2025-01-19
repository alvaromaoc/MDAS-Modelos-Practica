environment="$1"

./gradlew clean build -x test -Dquarkus.openshift.name="modelos-${environment}" \
  -Dquarkus.container-image.build=false \
  -Dquarkus.container-image.push=false \
  -Dquarkus.openshift.deploy=true