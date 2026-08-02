#
CURRENT_DIR=$(dirname "$(readlink -f "$0")")
BASE_DIR=$(readlink -f "${CURRENT_DIR}/../")
cd "${BASE_DIR}" || exit
# realpath