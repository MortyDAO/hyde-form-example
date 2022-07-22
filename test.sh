TAG=$(basename $(pwd))-test

docker build -t $TAG .
./test.raw.sh