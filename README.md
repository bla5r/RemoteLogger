# RemoteLogger

Tool to make Android app re-engineering 3rd party easier. This project provides remote logging functions for smali source code.

# Requirements

First of all, you have to decompile your Android app with APKTool (https://ibotpeaches.github.io/Apktool/). If you want to debug an app in a device out of your local network, you must have an internet reachable appliance with web server.

# Usage

1.
  + Execute installation script
```
	./install.sh "http://url.com[:port]/"
```
This code will generate your own logging smali class, with the URL you specialize.
2.
  + Put the file named "RemoteLogger.smali" on your root source directory
3.
  + Inject smali method calls in the app source code (see section below for more details)
4.
  + Recompile the app with APKTool
5.
  + Align and sign APK file
6.
  + Install APK on your (virtual) device

# Methods

The logger stores any variable and stack trace you added until flushing.

## Variable

Smali code to add a string variable:
```
	const-string v0, "key"

	const-string v1, "value"

	invoke-static {v0, v1}, LRemoteLogger;->add(Ljava/lang/String;Ljava/lang/String;)V
```
For others types, see smali code in "RemoteLogger.java" comments.

## Stack trace

Smali code to add a stack trace:
```
	invoke-static {}, LRemoteLogger;->addStackTrace()V
```

## Flush

Smali code to send data to your server:
```
	invoke-static {}, LRemoteLogger;->flush()V
```