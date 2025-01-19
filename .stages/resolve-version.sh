function newTag() {
  local latestTag=$(git tag --sort=-creatordate | head -n 1)

  if [ -z "$latestTag" ]; then
    echo "1.0.0-SNAPSHOT"
    return 0
  fi

  local major=$(echo "$latestTag" | cut -d '.' -f1)
  local minor=$(echo "$latestTag" | cut -d '.' -f2)

  local newMinor=$((minor + 1))

  echo "${major}.${newMinor}.0-SNAPSHOT"
}

branch="$1"

case "${branch}" in
  release/*|hotfix/*)
    echo "${branch}" | cut -d '/' -f2
    ;;
  *)
    newTag
    ;;
esac