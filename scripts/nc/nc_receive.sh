PORT=8090

file_name=$(nc -l -p $PORT)
echo $file_name
nc -l -p $PORT | base64 --decode > $file_name
