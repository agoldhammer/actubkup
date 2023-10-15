#! /bin/bash
set -e
BUCKET="s3://actubackups/"
DATE=$(date "+%F")
FNAME=/tmp/actur.$DATE.gz
echo "Backing up $FNAME to $BUCKET"

mongodump --archive=$FNAME --gzip --db=actur
/usr/local/bin/aws s3 cp $FNAME $BUCKET
rm $FNAME


