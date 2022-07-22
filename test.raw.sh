TAG=$(basename $(pwd))-test

#
# Embedding
# -----------------------------------------------------------------------------

rm -f test_data/texts-with-empty-dquotes/out/embedded.csv
rm -f test_data/texts-with-empty-dquotes/out/error.json
docker run --cpus=1.5 -m 2G \
  -v "$(pwd)"/test_data/texts-with-empty-dquotes/in:/parcel/data/in \
  -v "$(pwd)"/test_data/texts-with-empty-dquotes/out:/parcel/data/out \
  $TAG text-to-use4embed.py

echo "It should work fine with a line that contains only \"\"..."
if [ `cat test_data/texts-with-empty-dquotes/out/embedded.csv | sed 's/[^,]//g' | wc -c` = 511 ]; then
  echo "✅ "
else
  echo "🔥 "
  exit -1
fi

#
# Embedding Hyde survey response
# -----------------------------------------------------------------------------

rm -f test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json
rm -f test_data/hyde-form-response-to-embed-happy/out/error.json
docker run --cpus=1.5 -m 2G \
  -v "$(pwd)"/test_data/hyde-form-response-to-embed-happy/in:/parcel/data/in \
  -v "$(pwd)"/test_data/hyde-form-response-to-embed-happy/out:/parcel/data/out \
  $TAG hyde-form-response-to-embed.py

echo "It should keep non-anonymized fields in plain text"
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r .answers[0].value` == "Female" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi

echo "It should embed correctly so that every field has a 512-vector value"
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r '.answers[1].value | length'` == "512" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r '.answers[2].value | length'` == "512" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r '.answers[3].value | length'` == "512" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r '.answers[4].value | length'` == "512" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi
if [[ `cat test_data/hyde-form-response-to-embed-happy/out/hyde-form-response-embedded.json | jq -r '.answers[5].value | length'` == "512" ]]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi

#
# Chrome
# -----------------------------------------------------------------------------

rm -f test_data/chrome-browser-history-to-texts-empty-items/chrome-history-titles.csv
rm -f test_data/chrome-browser-history-to-texts-empty-items/error.json
docker run --cpus=1.5 -m 2G \
  -v "$(pwd)"/test_data/chrome-browser-history-to-texts-empty-items:/parcel/data/in \
  -v "$(pwd)"/test_data/chrome-browser-history-to-texts-empty-items:/parcel/data/out \
  $TAG chrome-browser-history-to-texts.py

echo "It should work fine with empty \"Browser History\"..."
if [ `cat test_data/chrome-browser-history-to-texts-empty-items/chrome-history-titles.csv | wc -c` = 5 ]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi

#
# Instagram
# -----------------------------------------------------------------------------

rm -f test_data/instagram-posts-to-texts-empty/instagram-posts.csv
rm -f test_data/instagram-posts-to-texts-empty/error.json
docker run --cpus=1.5 -m 2G \
  -v "$(pwd)"/test_data/instagram-posts-to-texts-empty:/parcel/data/in \
  -v "$(pwd)"/test_data/instagram-posts-to-texts-empty:/parcel/data/out \
  $TAG instagram-posts-to-texts.py

echo "It should work fine with empty data..."
if [ `cat test_data/instagram-posts-to-texts-empty/instagram-posts.csv | wc -c` = 5 ]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi

#
# Facebook
# -----------------------------------------------------------------------------

rm -f test_data/facebook-posts-and-comments-to-texts-empty/facebook-comments.csv
rm -f test_data/facebook-posts-and-comments-to-texts-empty/error.json
docker run --cpus=1.5 -m 2G \
  -v "$(pwd)"/test_data/facebook-posts-and-comments-to-texts-empty:/parcel/data/in \
  -v "$(pwd)"/test_data/facebook-posts-and-comments-to-texts-empty:/parcel/data/out \
  $TAG facebook-posts-and-comments-to-texts.py

echo "It should work fine with empty data..."
if [ `cat test_data/facebook-posts-and-comments-to-texts-empty/facebook-comments.csv | wc -c` = 5 ]; then
    echo "✅ "
else
    echo "🔥 "
    exit -1
fi

