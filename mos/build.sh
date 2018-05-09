#!/bin/sh

MOS="$HOME/.mos/bin/mos"

case "$1" in
	"flash") $MOS flash ;;
	"build") $MOS build --arch esp8266 --local --verbose ;;
	*) $MOS build --arch esp8266 --local --verbose && $MOS flash ;;
esac
