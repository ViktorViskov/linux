#!/bin/bash

# JS script to collect URLs
'
const item = await sessionStorage.getItem("$currentChapters")
const data = JSON.parse(item || "[]")


const videos = []
for (const chapter of data) {
  const url = chapter.videoUrl
  videos.push(url)
}


console.log("Videos:", videos)
'


film_name="billionaire_disguised_as_gigolo"
read -r -d '' json << JSON
[
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/1_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/2_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/3_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/4_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/5_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/6_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/7_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/8_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/9_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/10_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/11_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/12_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/13_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/14_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/15_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/16_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/17_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/18_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/19_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/20_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/21_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/22_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/23_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/24_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/25_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/26_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/27_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/28_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/29_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/30_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/31_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/32_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/33_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/34_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/35_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/36_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/37_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/38_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/39_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/40_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/41_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/42_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/43_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/44_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/45_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/46_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/47_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/48_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/49_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/50_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/51_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/52_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/53_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/54_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/55_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/56_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/57_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/58_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/59_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/60_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/61_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/62_.m3u8",
    "https://dj0vkl2i4vsbo.cloudfront.net/convert/Billionaire%20Disguised%20as%20Gigolo/en/2024-11-22%2016:45:34/63_.m3u8"
]
JSON

# Convert JSON array to Bash array
list=($(echo "$json" | jq -r '.[]'))

# Loop through the list and print each URL
number=0
for url in "${list[@]}"; do
    file_name="part_$number.mp4"

    # Download the m3u8 file and convert it to mp4
    ffmpeg -i $url -c copy -bsf:a aac_adtstoasc -crf 50 "$file_name"

    # Add the file name to the files.txt for concatenation
    echo "file '$file_name'" >> files.txt

    ((number++))
done

# concat the parts into a single mp4 file
ffmpeg -f concat -safe 0 -i files.txt -c copy "${film_name}.mp4"

# Clean up temporary files
rm files.txt
rm part_*.mp4
echo "Conversion complete: ${film_name}.mp4"

