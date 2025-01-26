latestTag=$(git tag --sort=-creatordate | head -n 1)

if [ -z "$latestTag" ]; then
  echo "1.0.0"
  return 0
fi

major=$(echo "$latestTag" | cut -d '.' -f1)
minor=$(echo "$latestTag" | cut -d '.' -f2)
patch=$(echo "$latestTag" | cut -d '.' -f3)

currentSha=$(git rev-parse --abbrev-ref HEAD)
commits=$(git rev-list --reverse "${latestTag}".."${currentSha}")

newMinor=$minor

for commit in $commits; do

  message="$(git log -n 1 --format=%B "$commit")"

  # Increment major version

  # Has BREAKING CHANGE ?
  if echo "${message}" | grep -q "BREAKING CHANGE"; then
    newMajor=$((major + 1))
    echo "${newMajor}.0.0"
    exit 0
  fi

  # Does have ! after <type> ?
  if echo "${message}" | grep -Eq "^(\w+)(\(.+\))?!:"; then
    newMajor=$((major + 1))
    echo "${newMajor}.0.0"
    exit 0
  fi

  # Increment minor version

  if [ "${newMinor}" != "${minor}" ]; then
    continue
  fi

  # Is <type> = feature ?
  if echo "${message}" | grep -Eq "^(feat)(\(.+\))?:"; then
    newMinor=$((minor + 1))
  fi

done

if [ "${newMinor}" != "${minor}" ]; then
  echo "${major}.${newMinor}.0"
  exit 0
fi

newPatch=$((patch + 1))
echo "${major}.${minor}.${newPatch}"
exit 0