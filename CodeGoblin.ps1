$codescsv = Import-Csv ".\4Codes.csv"
$codes = $codescsv | select -ExpandProperty code
# Add-Type -AssemblyName System.Windows.Forms
# [System.Windows.Forms.SendKeys]::SendWait('Your Text Here');
$windowtitle = 'UI APPNAME'
#you can only enter so many keys in one life so you need to enter X codes then stop and wait for keycombo to start again!
#WITH THIS FUNCTION DEFINE $WINDOWTITLE OF THE APP YOU WANT TO SEND THE KEYS TO AND IT WILL SEND $SENDKEYS TO IT!!!

#todo
#add a read-host to replace the name of the powershell windo with cords of base
#add the number of what code you are on to get a sence of the total.


function Do-SendKeys {
    param (
        $SENDKEYS,
        $WINDOWTITLE
        )
        $wshell = New-Object -ComObject wscript.shell;
        IF ($WINDOWTITLE) {$wshell.AppActivate($WINDOWTITLE)}
        Sleep .1
        IF ($SENDKEYS) {$wshell.SendKeys($SENDKEYS)}  

}

foreach ($code in $codes) {
    if ($x -le 4) {
        $code0 = $code[0]
        Do-SendKeys -WINDOWTITLE $windowtitle -SENDKEYS $code0
        $code1 = $code[1]
        Do-SendKeys -WINDOWTITLE $windowtitle -SENDKEYS $code1
        $code2 = $code[2]
        Do-SendKeys -WINDOWTITLE $windowtitle -SENDKEYS $code2
        $code3 = $code[3]
        Do-SendKeys -WINDOWTITLE $windowtitle -SENDKEYS $code3
        sleep 2
        $x++
        Write-Host $code
    } 
    else {
        Write-Host -NoNewLine 'Press any key to continue...'
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        $x = 0
    }
}
       

