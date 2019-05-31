decho() {
  echo "+ $@"
  eval "$@"
}

if [ ! -f .drone.jsonnet ]; then
  echo ".drone.jsonnet isn't found"
  exit 0
fi
TARGET=/tmp/.drone.yml
decho drone jsonnet $JSONNET_OPTS --target $TARGET || exit 1
decho diff .drone.yml $TARGET
if `diff -q .drone.yml $TARGET > /dev/null`; then
  exit 0
fi
echo "There is diff between .drone.yml and .drone.jsonnet" > /dev/stderr
exit 1
