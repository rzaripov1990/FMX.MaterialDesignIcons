# FMX.MaterialDesignIcons
[FireMonkey] Font - MaterialDesignIcons

## ANDROID
* Include `FMX.FontGlyphs.pas` and `FMX.FontGlyphs.Android.pas` to project
* Deploy font to project `RemotePath = assets\internal\`

## IOS
* Deploy font to project `RemotePath = .\`
* Create or Edit file `info.plist.TemplateiOS.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<%VersionInfoPListKeys%>
<%ExtraInfoPListKeys%>
	<key>UIAppFonts</key>
	<array>
		<string>MaterialDesignIcons.ttf</string>
 	</array>
</dict>
</plist>
```

## MACOS
* Deploy font to project

## WINDOWS
* Install font to system
