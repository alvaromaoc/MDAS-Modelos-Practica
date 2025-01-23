latestTag=$(git tag --sort=-creatordate | head -n 1)

if [ -z "$latestTag" ]; then
  echo "1.0.0"
  return 0
fi

major=$(echo "$latestTag" | cut -d '.' -f1)
minor=$(echo "$latestTag" | cut -d '.' -f2)
patch=$(echo "$latestTag" | cut -d '.' -f3)

newPatch=$((patch + 1))

echo "${major}.${minor}.${newPatch}"