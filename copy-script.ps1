# No history at this point of time
$thirdSize = 45296565454 / 3

$firstLength = 0
$secondLength = 0
$all = ls -File

$first = @()
$second = @()
$third = @()

foreach( $file in $all )
{
    if( $firstLength -lt $thirdSize )
    {
        $first += $file
        $firstLength += $file.Length
        continue
    }
    if( $secondLength -lt $thirdSize )
    {
        $second += $file
        $secondLength += $file.Length
        continue
    }
    $third += $file
}

$job = $third
$drive = "H:\"

foreach( $file in $job )
{
    $destination = Join-Path $drive $file.Name
    if( Test-Path $destination )
    {
        if( (Get-Item $destination).Length -ne $file.Length )
        {
            "Overwrite file: $($file.Name)"
            copy $file.FullName $drive -Force
        }
        else
        {
            "Skip file: $($file.Name)"
        }
    }
    else
    {
        "Copy file: $($file.Name)"
        copy $file.FullName $drive
    }
}





