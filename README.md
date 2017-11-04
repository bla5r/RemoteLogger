# RemoteLogger

Tiny tool to make Android app re-engineering 3rd party easier. This project provides remote logging functions for smali source code.

# Requirements

First of all, you have to decompile your Android app with [APKTool](https://ibotpeaches.github.io/Apktool/). Note that if you want to debug an app out of your local network, the device has to access WAN network and you must control an appliance reachable over Internet.

# Usage

  + Run installation script
```
	./install.sh "http://url.com[:port]/"
```
This script will generate your own logging smali class with the URL you specialize.
  + Put all smali files in "out" directory on the decompile root source directory
  + Inject smali method calls in the app source code (see section below for more details)
  + Recompile the app thanks to APKTool
  + Align and sign APK file
  + Install APK on your (virtual) device

# Methods

The logger stores any variables and stack traces you add until you flush.

## Variable

Smali code to add a string variable:
```
	const-string v0, "key"

	const-string v1, "value"

	invoke-static {v0, v1}, LRemoteLogger;->add(Ljava/lang/String;Ljava/lang/String;)V
```
For others types, see smali code in "[RemoteLogger.java](https://github.com/bla5r/RemoteLogger/blob/master/class/java/RemoteLogger.java)" comments.

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

# Server-side

I've developed a sample server monitor for this logger, you can check it out [here](https://github.com/bla5r/RemoteMonitor). Obviously, you're free to implement yours according to your needs.

When you call the flushing method, the class send a POST request to your server with all of your data in the body (JSON format). This is an example of output:
```
	{
		"ts": 1487180887,
		"exec": "123e4567-e89b-12d3-a456-426655440000",
		"r": 12,
		"vars": [{
			"key": "auth_token",
			"value": "ed735d55415bee976b771989be8f7005"
		}, {
			"key": "username",
			"value": "root"
		}],
		"stack": [
			"java.lang.Throwable ..."
		]
	}
```
  + "ts": Timestamp
  + "exec": Execution ID
  + "r": Request number (increment at each request)
  + "vars": All variables you logged
  + "stack": All stack traces you logged

# Contact

If you have any question about the project, feel free to contact me on Twitter: [@bla5r](https://twitter.com/bla5r) 
