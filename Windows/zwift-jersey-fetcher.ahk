;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        _._
;;       /_ _`.      (c) 2020, David A. Desrosiers
;;       (.(.)|      setuid at gmail dot com
;;       |\_/'|
;;       )____`\     Zwift Jersey Fetcher
;;      //_V _\ \
;;     ((  |  `(_)   If you find this useful, please drop me
;;    / \> '   / \   an email, or send me bug reports if you
;;    \  \.__./  /   find any problems with it. 
;;     `-'    `-'
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ScriptName = Zwift Jersey Fetcher
ScriptVersion = v1.0.1
#SingleInstance Force
#NoEnv

url = https://raw.githubusercontent.com/oliverlucas85/Zwift-Updater/master/promo-codes.zhq

KeyDelayFactor := 15 ;

; Make sure we're sending input to the correct window
; or use ahk_exe ZwiftApp.exe, use Win Spy to be sure
ZwiftApp_Window := "ahk_exe ZwiftApp.exe"

if ErrorLevel <> 
{
    WinActivate ZwiftApp_Window
    SetKeyDelay, % KeyDelayFactor*10, % KeyDelayFactor*10
    global ZwiftApp_Window
    MsgBox, 4,%ScriptName% / %ScriptVersion%, Ready to send all jersey codes to Zwift?
    IfMsgBox Yes
        promo_codes := HttpGet(url)
        jersey := StrSplit(Trim(promo_codes), "`n", "`r")
        for k, v in jersey
            ControlSend, ahk_parent, p%v%{Enter}, % ZwiftApp_Window
}

HttpGet(URL) {
    static req := ComObjCreate("Msxml2.XMLHTTP")
    req.open("GET", URL, false)
    ; Set to the epoch, because Msxml2.XMLHTTP caches the first request
    req.SetRequestHeader("If-Modified-Since", "Thu, 1 Jan 1970 00:00:00 GMT")
    req.send()
    return req.responseText
}
