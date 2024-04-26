#!/usr/bin/env bash

COVER_PATH=$1
cd $COVER_PATH
IMGPATH="$COVER_PATH/music_cover.png"
playerctl -F metadata mpris:artUrl 2>/dev/null | while read -r COVER_URL; do
    if [[ "$COVER_URL" = https* ]]; then
        if [ ! -e "$COVER_PATH/$(basename "$COVER_URL")" ]; then
            wget -N "$COVER_URL" -o /dev/null
        fi

        rm "$IMGPATH"
        ln -s "$(basename "$COVER_URL")" "$IMGPATH"

        echo "$IMGPATH"
    elif [ "$COVER_URL" = "" ]; then
        echo ""
    else
        echo "$COVER_URL"
    fi
done
