#!/bin/sh

mkdir BlizzHUDHelper && cp -ar BlizzHUD_Helper.lua BlizzHUD_Helper.toc embeds.xml libs/ BlizzHUDHelper
zip -r BlizzHUDHelper.zip BlizzHUDHelper
curl -H -v "x-api-token:$WOW_INTERFACE_TOKEN" https://api.wowinterface.com/addons/update -F "id=$WOW_INTERFACE_PROJECT_NUMBER" -F "version=$CI_COMMIT_TAG" -F "compatible=10.0" -F "updatefile=BlizzHUD_Helper.zip"
