DOCKER_NAMESPACE =	armbuild/
NAME =			ocs-app-serendipity
VERSION =		latest
VERSION_ALIASES =	14.04 lts trusty
TITLE =			Serendipity
DESCRIPTION =		Serendipity with SQLite
SOURCE_URL =		https://github.com/onli/image-app-serendipity


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://raw.githubusercontent.com/scaleway/image-tools/master/builder/install.sh | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
