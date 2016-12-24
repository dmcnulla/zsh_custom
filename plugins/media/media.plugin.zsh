

convert_avi_to_mp4() {
	for file in *; do ffmpeg -i "$file" -c:v libx264 -q:v 1 -strict experimental -c:a aac -b:a 160k "${file/wmv/mp4}"; done
}
