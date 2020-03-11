#!/usr/bin/env bash

pkill mako
mako \
    --font="DejaVu Sans Mono" \
    --background-color="#000000" \
    --text-color="#ffffff" \
    --border-size=2 \
    --border-color="#b2c312" \
    --default-timeout=5000 \
    --anchor="top-left" \
    --sort="+time"
