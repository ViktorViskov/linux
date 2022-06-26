while true; do
    sleep 600
    wget https://picsum.photos/1920/1080 -O /home/viktor/bg.jpg
    rm wget-log
    fbsetbg /home/viktor/bg.jpg
done
