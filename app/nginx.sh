#!/bin/bash

if [ -z "${RELAY_STREAM_KEY}" ]; then
    echo "STREAM_KEY is not set. Exiting."
    exit 1
fi

if [ -z "${FACEBOOK_STREAM_KEY}" ] && [ -z "${YOUTUBE_STREAM_KEY}" ]; then
    echo "FACEBOOK_STREAM_KEY and YOUTUBE_STREAM_KEY are not set. You need to set at least one of them. Exiting."
    exit 1
fi

stream_urls=""

if [ -n "${YOUTUBE_STREAM_KEY}" ]; then
    stream_urls=$(echo -e "${stream_urls}\n            push rtmp://a.rtmp.youtube.com/live2/${YOUTUBE_STREAM_KEY};\n")
fi
if [ -n "${FACEBOOK_STREAM_KEY}" ]; then
    stream_urls=$(echo -e "${stream_urls}\n            push rtmp://127.0.0.1:1936/rtmp/${FACEBOOK_STREAM_KEY};\n")
fi

cat <<EOF > /etc/nginx/rtmp.conf.d/rtmp.conf
rtmp {
    server {
        listen 1935;
        chunk_size 4096;

        application ${RELAY_STREAM_KEY} {
            live on;
            record off;
${stream_urls}
        }
    }
}
EOF

echo 'Starting nginx...'
nginx -g 'daemon off;'
