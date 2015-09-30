NAME =			serendipity
VERSION =		latest
VERSION_ALIASES =	2.0.1
TITLE =			Serendipity
DESCRIPTION =		Serendipity with SQLite
SOURCE_URL =		https://github.com/scaleway-community/scaleway-serendipity
VENDOR_URL =		http://www.s9y.org

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT = 	stable
IMAGE_NAME =		Serendipity 2


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
