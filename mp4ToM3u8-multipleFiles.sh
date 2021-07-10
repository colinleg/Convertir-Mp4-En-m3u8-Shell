#! /bin/bash

# Ce script peut s'éxecuter dans un dossier comportant plusieurs fichiers .mp4

arrFilesMp4=`find . -name '*.mp4' `

i=0
j=0

# Crée pour chaque fichier .mp4, un dossier avec comme sous dossier /1080, /720 et /360
for file in $arrFilesMp4
    do
        hls="hls-";
        a=`basename ${file}`;
        b=` echo "${a%.*}" `;
        nameDirectory=$hls$b;
        mkdir $nameDirectory $nameDirectory/1080 $nameDirectory/720 $nameDirectory/360;
        #Creation de variables dans une loop
        eval "nameDir$i=$nameDirectory";
        eval "inputFile$j=$a";
        let i=$((i+1));
        let j=$((j+1));

        # converti le mp4 en fichiers ts + m3u8, 1920x1080
        ffmpeg -i $a -vf scale=w=1920:h=1080:force_original_aspect_ratio=decrease -c:a aac -ar 48000 -b:a 128k -c:v h264 -profile:v main -crf 20 -g 48 -keyint_min 48 -sc_threshold 0 -b:v 2500k -maxrate 2675k -bufsize 3750k -hls_time 4 -hls_playlist_type vod -hls_segment_filename $nameDirectory/1080/1920x1080_%03d.ts $nameDirectory/1080/1920x1080.m3u8

        # converti le mp4 en fichiers ts + m3u8, 1280x720
        ffmpeg -i $a -vf scale=w=1280:h=720:force_original_aspect_ratio=decrease -c:a aac -ar 48000 -b:a 128k -c:v h264 -profile:v main -crf 20 -g 48 -keyint_min 48 -sc_threshold 0 -b:v 2500k -maxrate 2675k -bufsize 3750k -hls_time 4 -hls_playlist_type vod -hls_segment_filename $nameDirectory/720/1280x720_%03d.ts $nameDirectory/720/1280x720.m3u8

        # converti le mp4 en fichiers ts + m3u8,  640x360
        ffmpeg -i $a -vf scale=w=640:h=360:force_original_aspect_ratio=decrease -c:a aac -ar 48000 -b:a 128k -c:v h264 -profile:v main -crf 20 -g 48 -keyint_min 48 -sc_threshold 0 -b:v 2500k -maxrate 2675k -bufsize 3750k -hls_time 4 -hls_playlist_type vod -hls_segment_filename $nameDirectory/360/640x360_%03d.ts $nameDirectory/360/640x360.m3u8

    done
