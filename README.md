# Usage

- Build for local testing: `$ ./build.sh`
- Run a script for local testing: `$ ./dev SCRIPT.py`
- Push newly built image: `$ ./push.sh`

# NOTE to run text-2-use4embed locally

You need to have the model in your `universal-sentence-encoder-4` directory to test it locally:

$ curl -o universal-sentence-encoder-4.tar.gz https://storage.googleapis.com/tfhub-modules/google/universal-sentence-encoder/4.tar.gz
$ mkdir universal-sentence-encoder-4
$ mv universal-sentence-encoder-4.tar.gz && cd universal-sentence-encoder-4
$ tar xvf universal-sentence-encoder-4.tar.gz

