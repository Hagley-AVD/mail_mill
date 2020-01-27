<# Import-Module PSLogging #>
. \\data1\shared\mail_mill\etc\cred.ps1
Write-Host "$user $pw"
& C:\Python27\python.exe \\data1\shared\mail_mill\etc\dev_gmail_dump.py -u $user -p $pw -l \\data1\shared\mail_mill\Staging

$eArray = @(Get-ChildItem -Path \\data1\shared\mail_mill\Converted\* -File -Name -Include *.eml)
$sArray = @(Get-ChildItem -Path \\data1\shared\mail_mill\Staging\* -File -Name -Include *.eml)
$fArray = @(Compare-Object $eArray $sArray | Select-Object -Expand InputObject)
<# $logDate = Get-Date -format yyyyMMddHHmm
$logName = "EMAIL_$logDate.log" #>

<# Start-Log -LogPath "\\DATA2\AVD_Dept\MIKE\Logs" -LogName "$logName" -ScriptVersion "1.0" #>


foreach ($eml in $fArray){
Start-Process \\data1\shared\mail_mill\etc\EmailConverterConsole.exe -Args " -a \\data1\shared\mail_mill\Staging\$eml -o \\data1\shared\mail_mill\Converted\$eml.pdf -hh" -NoNewWindow | Wait-Process -Timeout 300
Copy-Item -Path \\data1\shared\mail_mill\Staging\$eml -Destination \\data1\shared\mail_mill\Converted\\$eml
<# $timeLoad = Get-Date
Write-LogInfo -LogPath "\\DATA2\AVD_Dept\MIKE\Logs\$logName" -Message "$collection downloaded at $timeLoad." #>
	}

<#Stop-Log -LogPath "\\DATA2\AVD_Dept\MIKE\Logs\$logName"#>