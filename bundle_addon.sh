#!/bin/sh

mkdir BlizzHUDHelper && cp -ar BlizzHUD_Helper.lua BlizzHUD_Helper.toc embeds.xml libs/ BlizzHUDHelper
zip -r BlizzHUDHelper.zip BlizzHUDHelper
