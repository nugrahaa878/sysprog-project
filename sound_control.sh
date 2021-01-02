#!/bin/bash

soundControlMenu() {
    printf "=========================== \n         MAIN MENU\n===========================\n"
    printf "1. Increase Volume\n"
    printf "2. Decrease Volume\n"
    printf "3. Play me an example Song\n"
    printf "4. Exit\n"

    printf "choose 1-4: "
    read N

    case $N in
        1)
            increaseSound
            ;;
        2)
            decreaseSound
            ;;
        3)
            playMusic
            ;;
        4)
            printf "Good Bye!\n"
            exit
    esac
}

increaseSound() {
    amixer set Master 10%+
    printf "[Volume Increased]\n"
    soundControlMenu
}

decreaseSound() {
    amixer set Master 10%-
    printf "[Volume Decreased]\n"
    soundControlMenu
}

playMusic() {
    if [ ! -f "file_example_WAV_1MG.wav" ]; then
        wget https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav
    fi
    aplay file_example_WAV_1MG.wav
    printf "[Music Played]"
    soundControlMenu
}

main() {
    printf "[Welcome to Sound Control by MIA]\n"
    soundControlMenu
}

main