#!/bin/bash

menuSatu() {
    printf "=========================== \n         MAIN MENU\n===========================\n"
    printf "1. Increase Volume\n"
    printf "2. Decrease Volume\n"
    printf "3. Play me a Song\n"

    printf "choose 1-3: " 
    read N

    case $N in 
        1)
            increaseSound
            ;;
        2) 
            decreaseSound
            ;;
        3)
            printTiga
            ;;
    esac
}

increaseSound() {
    amixer set Master 10%+
    menuSatu
}

decreaseSound() {
    amixer set Master 10%-
    menuSatu
}

printTiga() {
    printf "===========================\n       SONG LIST\n===========================\n"
    printf "1. Example Music\n"
    printf "2. Decrease Volume\n"
    printf "3. Play me a Song\n"

    # case $N in 
    #     1)
    #         exampleMusic
    #         ;;
    #     2) 
    #         printDua
    #         ;;
    #     3)
    #         printTiga
    #         ;;
    # esac
}

# exampleMusic() {
#     wget https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav
#     aplay file_example_WAV_1MG.wav
#     menuSatu
# }

main() {
    menuSatu
}

main