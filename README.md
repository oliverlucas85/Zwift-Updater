# Zwift Jersey Fetcher
&copy;2020, David A. Desrosiers <setuid@gmail.com>

## What is this crazy thing?
---
Zwift Jersey Fetcher (zjf for short), is a quick little tool I whipped up to load up your Zwift garage (closet?) with all of the public jersey codes currently known. 

I've aggregated and scraped as many as I can publicly share, 56 total jerseys at the moment, and included them in this repository. 

This tool will reach out to this repository, pull the manifest of jersey promo codes, and automatically stuff them into your Zwift client. 

Yes, it handles the typing for you, because there's no easy way to inject them into your individual profile, without using a very undocumented set of API calls.

### How do I use it?
---
#### Windows 
---
1. Download and install the [AutoHotKey installer](https://www.autohotkey.com/download/), install
2. Launch Zwift and log in, go through the initial [Skip] or [Ride] screens until you're at the point where you're sitting on the road, idling on your bike, ready to pedal. 
3. Open a Windows Explorer window and navigate to where you've saved the zwift-jersey-fetcher.ahk script. 
4. Right-click the script and choose "Run Script" from your Windows pop-up context menu. 

If you installed AutoHotKey correctly, the script will target your open Zwift application and begin stuffing jersey promo codes into the UI for you. 

If you don't want to install AutoHotKey on your Windows machine, you can just use the executable in this repository, right alongside the .ahk script. It's a pre-compiled version of the same AutoHotKey script. The two are identical, except the .exe has a loader that allows it to run without the full AutoHotKey installer required. 

I've tested this extensively on my laptop, but YMMV, so please make sure you report back any odd behavior you see with the utility. 

####  Android
---
Android users will need to install the latest verison of [Tasker](https://tasker.joaoapps.com/) in order to leverage the same capability. 

Tasker is an _incredibly_ powerful suite of utilities, and there's almost nothing you can't do or automate with it. If you want to learn more about what it can do, jump over to the [Tasker Tutorials](https://www.youtube.com/playlist?list=PLjV3HijScGMynGvjJrvNNd5Q9pPy255dL) section on YouTube and learn more about it. 

In Tasker, you create a 'scene' based on triggers, events, log entries, input/output, incoming messages, date/time, geolocation and many other things. You can also fully automate tapping and clicking through an app, filling out forms, clicking checkboxes and buttons. 

As of the writing of this README (Feb 2, 2020), I haven't pushed the Tasker XML that automates Zwift, but that will be coming shortly. I use several dozen Tasker tasks to automate and secure my Android device under various conditions.

#### macOS 
---
Mac users have a great tool called "Automator" that is built into macOS. You can do a lot of pretty amazing things with it. The fully-automated Automator method of injecting these same jersey codes will follow shortly. 


#### Linux
---
Of course Zwift doesn't natively run on Linux, not without some effort and horsepower to emulate it, but the tooling to automatically generate the automation for Windows (AutoHotKey), Android (Tasker), and macOS (Automator) will be rolled into Python code using Jinja2 templates to generate the OS-specific automation. That will be included here as well. 
