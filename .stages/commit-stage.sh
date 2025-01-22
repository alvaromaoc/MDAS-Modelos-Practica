branch="$1"

./gradlew clean build sonar \
  -Dsonar.branch.name="${branch}" \
  -Dquarkus.container-image.build=false \
  -Dquarkus.container-image.push=false \
  -Dquarkus.openshift.deploy=false