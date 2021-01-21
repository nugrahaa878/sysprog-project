#!/bin/bash

increaseSound() {
    amixer set Master 10%+
    printf "[Volume Increased]\n"
}

decreaseSound() {
    amixer set Master 10%-
    printf "[Volume Decreased]\n"
}

playMusic() {
    if [ ! -f "file_example_WAV_1MG.wav" ]; then
        wget https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav
    fi
    aplay file_example_WAV_1MG.wav
    printf "[Music Played]\n"
}

if [[ $1 == "inc" ]]; then
        increaseSound
elif [[ $1 == "dec" ]]; then
        decreaseSound
elif [[ $1 == "play" ]]; then
        playMusic
elif [[ $1 == "exit" ]]; then
        printf "Good Bye!\n"
        exit
else
	echo "[Welcome to Sound Control by MIA]"
        echo "- To increase volume, add argument inc"
        echo "- To decrease volume, add argument dec"
        echo "- To play demo music, add argument play"
        echo "- To exit, add argument exit"
fi



