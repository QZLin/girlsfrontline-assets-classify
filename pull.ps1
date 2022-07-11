$packageName = "com.sunborn.girlsfrontline.cn"

Push-Location source

adb pull /sdcard/Android/data/$packageName .
# adb pull

Pop-Location