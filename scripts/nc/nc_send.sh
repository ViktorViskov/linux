ADDR='localhost'
PORT=8090

file_name=$1

if [ "$file_name" = "" ]
then
    echo "File not selected"
    return
fi

echo $file_name | nc -q 0 $ADDR $PORT
base64 $file_name | nc -q 0 $ADDR $PORT
