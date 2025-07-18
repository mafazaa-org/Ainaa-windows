@echo off

:isAdmin
:: Check for admin rights
NET SESSION >nul 2>&1
if %errorlevel% == 0 (
    echo protecting the device...
) else (
    echo Requesting administrator permissions...
    :: Re-launch as admin
    PowerShell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

set /a layer=1

@rem hosts file script

:hostsFileScript
echo applying layer %layer% protection
set file=C:\Windows\System32\drivers\etc\hosts

findstr /i /c:"#mafazaa-hosts-start" "%file%" >nul
if %errorlevel% equ 0 (
    
    echo protection layer %layer% already exists

    goto regEditChromeScript
) else (    
    echo #mafazaa-hosts-start >> %file%

    echo 216.239.38.120 www.google.com >> %file%
    echo 216.239.38.120 www.google.com >> %file%
    echo 216.239.38.120 www.google.ad >> %file%
    echo 216.239.38.120 www.google.ae >> %file%
    echo 216.239.38.120 www.google.com.af >> %file%
    echo 216.239.38.120 www.google.com.ag >> %file%
    echo 216.239.38.120 www.google.al >> %file%
    echo 216.239.38.120 www.google.am >> %file%
    echo 216.239.38.120 www.google.co.ao >> %file%
    echo 216.239.38.120 www.google.com.ar >> %file%
    echo 216.239.38.120 www.google.as >> %file%
    echo 216.239.38.120 www.google.at >> %file%
    echo 216.239.38.120 www.google.com.au >> %file%
    echo 216.239.38.120 www.google.az >> %file%
    echo 216.239.38.120 www.google.ba >> %file%
    echo 216.239.38.120 www.google.com.bd >> %file%
    echo 216.239.38.120 www.google.be >> %file%
    echo 216.239.38.120 www.google.bf >> %file%
    echo 216.239.38.120 www.google.bg >> %file%
    echo 216.239.38.120 www.google.com.bh >> %file%
    echo 216.239.38.120 www.google.bi >> %file%
    echo 216.239.38.120 www.google.bj >> %file%
    echo 216.239.38.120 www.google.com.bn >> %file%
    echo 216.239.38.120 www.google.com.bo >> %file%
    echo 216.239.38.120 www.google.com.br >> %file%
    echo 216.239.38.120 www.google.bs >> %file%
    echo 216.239.38.120 www.google.bt >> %file%
    echo 216.239.38.120 www.google.co.bw >> %file%
    echo 216.239.38.120 www.google.by >> %file%
    echo 216.239.38.120 www.google.com.bz >> %file%
    echo 216.239.38.120 www.google.ca >> %file%
    echo 216.239.38.120 www.google.cd >> %file%
    echo 216.239.38.120 www.google.cf >> %file%
    echo 216.239.38.120 www.google.cg >> %file%
    echo 216.239.38.120 www.google.ch >> %file%
    echo 216.239.38.120 www.google.ci >> %file%
    echo 216.239.38.120 www.google.co.ck >> %file%
    echo 216.239.38.120 www.google.cl >> %file%
    echo 216.239.38.120 www.google.cm >> %file%
    echo 216.239.38.120 www.google.cn >> %file%
    echo 216.239.38.120 www.google.com.co >> %file%
    echo 216.239.38.120 www.google.co.cr >> %file%
    echo 216.239.38.120 www.google.com.cu >> %file%
    echo 216.239.38.120 www.google.cv >> %file%
    echo 216.239.38.120 www.google.com.cy >> %file%
    echo 216.239.38.120 www.google.cz >> %file%
    echo 216.239.38.120 www.google.de >> %file%
    echo 216.239.38.120 www.google.dj >> %file%
    echo 216.239.38.120 www.google.dk >> %file%
    echo 216.239.38.120 www.google.dm >> %file%
    echo 216.239.38.120 www.google.com.do >> %file%
    echo 216.239.38.120 www.google.dz >> %file%
    echo 216.239.38.120 www.google.com.ec >> %file%
    echo 216.239.38.120 www.google.ee >> %file%
    echo 216.239.38.120 www.google.com.eg >> %file%
    echo 216.239.38.120 www.google.es >> %file%
    echo 216.239.38.120 www.google.com.et >> %file%
    echo 216.239.38.120 www.google.fi >> %file%
    echo 216.239.38.120 www.google.com.fj >> %file%
    echo 216.239.38.120 www.google.fm >> %file%
    echo 216.239.38.120 www.google.fr >> %file%
    echo 216.239.38.120 www.google.ga >> %file%
    echo 216.239.38.120 www.google.ge >> %file%
    echo 216.239.38.120 www.google.gg >> %file%
    echo 216.239.38.120 www.google.com.gh >> %file%
    echo 216.239.38.120 www.google.com.gi >> %file%
    echo 216.239.38.120 www.google.gl >> %file%
    echo 216.239.38.120 www.google.gm >> %file%
    echo 216.239.38.120 www.google.gr >> %file%
    echo 216.239.38.120 www.google.com.gt >> %file%
    echo 216.239.38.120 www.google.gy >> %file%
    echo 216.239.38.120 www.google.com.hk >> %file%
    echo 216.239.38.120 www.google.hn >> %file%
    echo 216.239.38.120 www.google.hr >> %file%
    echo 216.239.38.120 www.google.ht >> %file%
    echo 216.239.38.120 www.google.hu >> %file%
    echo 216.239.38.120 www.google.co.id >> %file%
    echo 216.239.38.120 www.google.ie >> %file%
    echo 216.239.38.120 www.google.co.il >> %file%
    echo 216.239.38.120 www.google.im >> %file%
    echo 216.239.38.120 www.google.co.in >> %file%
    echo 216.239.38.120 www.google.iq >> %file%
    echo 216.239.38.120 www.google.is >> %file%
    echo 216.239.38.120 www.google.it >> %file%
    echo 216.239.38.120 www.google.je >> %file%
    echo 216.239.38.120 www.google.com.jm >> %file%
    echo 216.239.38.120 www.google.jo >> %file%
    echo 216.239.38.120 www.google.co.jp >> %file%
    echo 216.239.38.120 www.google.co.ke >> %file%
    echo 216.239.38.120 www.google.com.kh >> %file%
    echo 216.239.38.120 www.google.ki >> %file%
    echo 216.239.38.120 www.google.kg >> %file%
    echo 216.239.38.120 www.google.co.kr >> %file%
    echo 216.239.38.120 www.google.com.kw >> %file%
    echo 216.239.38.120 www.google.kz >> %file%
    echo 216.239.38.120 www.google.la >> %file%
    echo 216.239.38.120 www.google.com.lb >> %file%
    echo 216.239.38.120 www.google.li >> %file%
    echo 216.239.38.120 www.google.lk >> %file%
    echo 216.239.38.120 www.google.co.ls >> %file%
    echo 216.239.38.120 www.google.lt >> %file%
    echo 216.239.38.120 www.google.lu >> %file%
    echo 216.239.38.120 www.google.lv >> %file%
    echo 216.239.38.120 www.google.com.ly >> %file%
    echo 216.239.38.120 www.google.co.ma >> %file%
    echo 216.239.38.120 www.google.md >> %file%
    echo 216.239.38.120 www.google.me >> %file%
    echo 216.239.38.120 www.google.mg >> %file%
    echo 216.239.38.120 www.google.mk >> %file%
    echo 216.239.38.120 www.google.ml >> %file%
    echo 216.239.38.120 www.google.com.mm >> %file%
    echo 216.239.38.120 www.google.mn >> %file%
    echo 216.239.38.120 www.google.com.mt >> %file%
    echo 216.239.38.120 www.google.mu >> %file%
    echo 216.239.38.120 www.google.mv >> %file%
    echo 216.239.38.120 www.google.mw >> %file%
    echo 216.239.38.120 www.google.com.mx >> %file%
    echo 216.239.38.120 www.google.com.my >> %file%
    echo 216.239.38.120 www.google.co.mz >> %file%
    echo 216.239.38.120 www.google.com.na >> %file%
    echo 216.239.38.120 www.google.com.ng >> %file%
    echo 216.239.38.120 www.google.com.ni >> %file%
    echo 216.239.38.120 www.google.ne >> %file%
    echo 216.239.38.120 www.google.nl >> %file%
    echo 216.239.38.120 www.google.no >> %file%
    echo 216.239.38.120 www.google.com.np >> %file%
    echo 216.239.38.120 www.google.nr >> %file%
    echo 216.239.38.120 www.google.nu >> %file%
    echo 216.239.38.120 www.google.co.nz >> %file%
    echo 216.239.38.120 www.google.com.om >> %file%
    echo 216.239.38.120 www.google.com.pa >> %file%
    echo 216.239.38.120 www.google.com.pe >> %file%
    echo 216.239.38.120 www.google.com.pg >> %file%
    echo 216.239.38.120 www.google.com.ph >> %file%
    echo 216.239.38.120 www.google.com.pk >> %file%
    echo 216.239.38.120 www.google.pl >> %file%
    echo 216.239.38.120 www.google.pn >> %file%
    echo 216.239.38.120 www.google.com.pr >> %file%
    echo 216.239.38.120 www.google.ps >> %file%
    echo 216.239.38.120 www.google.pt >> %file%
    echo 216.239.38.120 www.google.com.py >> %file%
    echo 216.239.38.120 www.google.com.qa >> %file%
    echo 216.239.38.120 www.google.ro >> %file%
    echo 216.239.38.120 www.google.ru >> %file%
    echo 216.239.38.120 www.google.rw >> %file%
    echo 216.239.38.120 www.google.com.sa >> %file%
    echo 216.239.38.120 www.google.com.sb >> %file%
    echo 216.239.38.120 www.google.sc >> %file%
    echo 216.239.38.120 www.google.se >> %file%
    echo 216.239.38.120 www.google.com.sg >> %file%
    echo 216.239.38.120 www.google.sh >> %file%
    echo 216.239.38.120 www.google.si >> %file%
    echo 216.239.38.120 www.google.sk >> %file%
    echo 216.239.38.120 www.google.com.sl >> %file%
    echo 216.239.38.120 www.google.sn >> %file%
    echo 216.239.38.120 www.google.so >> %file%
    echo 216.239.38.120 www.google.sm >> %file%
    echo 216.239.38.120 www.google.sr >> %file%
    echo 216.239.38.120 www.google.st >> %file%
    echo 216.239.38.120 www.google.com.sv >> %file%
    echo 216.239.38.120 www.google.td >> %file%
    echo 216.239.38.120 www.google.tg >> %file%
    echo 216.239.38.120 www.google.co.th >> %file%
    echo 216.239.38.120 www.google.com.tj >> %file%
    echo 216.239.38.120 www.google.tl >> %file%
    echo 216.239.38.120 www.google.tm >> %file%
    echo 216.239.38.120 www.google.tn >> %file%
    echo 216.239.38.120 www.google.to >> %file%
    echo 216.239.38.120 www.google.com.tr >> %file%
    echo 216.239.38.120 www.google.tt >> %file%
    echo 216.239.38.120 www.google.com.tw >> %file%
    echo 216.239.38.120 www.google.co.tz >> %file%
    echo 216.239.38.120 www.google.com.ua >> %file%
    echo 216.239.38.120 www.google.co.ug >> %file%
    echo 216.239.38.120 www.google.co.uk >> %file%
    echo 216.239.38.120 www.google.com.uy >> %file%
    echo 216.239.38.120 www.google.co.uz >> %file%
    echo 216.239.38.120 www.google.com.vc >> %file%
    echo 216.239.38.120 www.google.co.ve >> %file%
    echo 216.239.38.120 www.google.co.vi >> %file%
    echo 216.239.38.120 www.google.com.vn >> %file%
    echo 216.239.38.120 www.google.vu >> %file%
    echo 216.239.38.120 www.google.ws >> %file%
    echo 216.239.38.120 www.google.rs >> %file%
    echo 216.239.38.120 www.google.co.za >> %file%
    echo 216.239.38.120 www.google.co.zm >> %file%
    echo 216.239.38.120 www.google.co.zw >> %file%
    echo 216.239.38.120 www.google.cat >> %file%
    echo 216.239.38.120 www.youtube.com >> %file%
    echo 216.239.38.120 m.youtube.com >> %file%
    echo 216.239.38.120 youtubei.googleapis.com >> %file%
    echo 216.239.38.120 youtube.googleapis.com >> %file%
    echo 216.239.38.120 www.youtube-nocookie.com >> %file%
    echo 20.207.72.188 duckduckgo.com >> %file%
    echo 204.79.197.220 www.bing.com bing.com >> %file%
    echo 204.79.197.220 www2.bing.com >> %file%
    echo 204.79.197.220 www3.bing.com >> %file%

    echo #mafazaa-hosts-end >> %file%

    echo protection layer %layer% is applied successfully

    goto regEditChromeScript

)


@rem chrome script from the registry editor
:regEditChromeScript
set /a layer=%layer%+1

echo applying layer %layer% protection
set k=HKLM\SOFTWARE\Policies\Google\Chrome
reg query "%k%" >nul 2>&1 || (
    reg add "%k%" /f
)
reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://low-dns.mafazaa.com" /f
echo protection layer %layer% is applied successfully


@rem brave script from the registry editor
:regEditBraveScript
set /a layer=%layer%+1

echo applying layer %layer% protection
set k=HKLM\Software\Policies\BraveSoftware\Brave
reg query "%k%" >nul 2>&1 || (
    reg add "%k%" /f
)
reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://low-dns.mafazaa.com" /f
echo protection layer %layer% is applied successfully


@rem netsh script
:netshScript
setlocal enableDelayedExpansion


for /f "tokens=5 delims= " %%i in ('netsh interface ip show interfaces ^| findstr "connected"') do (

    call set /a layer=layer+1
    
    netsh interface ip set dns %%i static 16.24.111.209

    netsh interface ip add dns name="%%i" 16.24.202.94 index=2

    echo layer !layer! is applied successfully
)
echo.
echo.
echo %layer% layers of protection are applied on the device successfully! you can now exit
pause