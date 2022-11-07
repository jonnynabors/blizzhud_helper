build:
	docker build . -t wow_addon_builder --rm

shell-in:
	docker run -it --rm wow_addon_builder:latest sh

build-for-ci:
	docker build -t registry.gitlab.com/jonnynabors/blizzhud_helper .

push-build-image-to-gitlab:
	docker push registry.gitlab.com/jonnynabors/blizzhud_helper