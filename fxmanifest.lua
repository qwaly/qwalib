author "Qwaly"
version "1.0.0"
name "Qwaly Lib"
description "Utility lib for Qwaly scripts"

fx_version "cerulean"
game "gta5"

use_experimental_fxv2_oal "yes"
lua54 "yes"

files {
	"bridge/client/**/*.lua",
	"bridge/server/**/*.lua"
}

shared_scripts {
	"bridge/shared/*.lua"
}

client_scripts {
	"bridge/client/init.lua"
}

server_scripts {
	"bridge/server/init.lua"
}
