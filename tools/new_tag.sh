set -e
new_version=v$1

echo set git tag ..
git tag $new_version 
git push origin --tags