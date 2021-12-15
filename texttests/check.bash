set +euo pipefail

cd $(dirname "$0")

case $1 in
  ruby)
    command="ruby ../ruby/texttest_fixture.rb 30"
    ;;
  typescript)
    command="../TypeScript/node_modules/.bin/ts-node ../TypeScript/texttest-fixture.ts 30"
    ;;
  go)
    command="(cd ../go; go run . 30)"
    ;;
  *)
    echo "Usage: check.bash < ruby | typescript | go >" >&2
    exit 1
    ;;
esac

out=$(mktemp)
function cleanup {
  rm -f "$out"
}
trap cleanup EXIT

eval "$command > $out"

echo "Comparing output against ./ThirtyDays/stdout.gr"
git diff -w --no-index --exit-code --unified=10 ./ThirtyDays/stdout.gr "$out"
echo "OK!"
