function robohelp( $template )
{
    $found = robocopy /? | where{ $_ -match $template }
    $found | hl $template yellow
}

/FFT :: assume FAT File Times (2-second granularity).
for unix-based NAS
 /np = no progress counter
/LOG+:file :: output status to LOG file (append to existing log).
/Z - restart on network failures
/TBD :: wait for sharenames To Be Defined (retry error 67).
/FAT :: create destination files using 8.3 FAT file names only.

robocopy C:\Data\CDs \\NAS\Music\CDs /MIR /XA:H /W:0 /R:1 /REG /FFT >> C:\externalbackup.log

NET USE \\192.168.0.100\home /USER:admin admin
ROBOCOPY \\remoteserver\sourcepath \\localserver\destpath ...
NET USE \\192.168.0.100\home /DEL


do
{
    NET USE \\192.168.0.100\home /USER:admin admin | Out-Null
}
until( $lastexitcode -eq 0 )



NET USE \\192.168.0.100\home /DEL
