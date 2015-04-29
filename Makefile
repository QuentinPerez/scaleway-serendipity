DOCKER_NAMESPACE =	onli/
NAME =			scw-app-serendipity
VERSION =		latest
VERSION_ALIASES =	14.04 lts trusty 2.0.1
TITLE =			Serendipity
DESCRIPTION =		Serendipity with SQLite
SOURCE_URL =		https://github.com/onli/image-app-serendipity


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
