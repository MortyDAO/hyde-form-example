TAG=$(basename $(pwd))
SCRIPT=$1

if [ -z "$SCRIPT" ]; then
    echo "No argument supplied.\nExample: $ ./dev.sh SCRIPT.py"
    exit -1
fi

if [ ! -f "$SCRIPT" ]; then
    echo "$SCRIPT is not a file.\nExample: $ ./dev.sh SCRIPT.py"
    exit -1
fi

docker run --cpus=1.5 -m 2G -v "$(pwd)"/test_data/happy/in:/parcel/data/in -v "$(pwd)"/test_data/happy/out:/parcel/data/out $TAG $1
