#!/bin/bash

configure_keyboard() {
	# Set faster key repeat see https://mac-os-key-repeat.vercel.app/
	defaults write -g InitialKeyRepeat -int 4
	defaults write -g KeyRepeat -int 1
}
