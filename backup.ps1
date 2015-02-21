$tasks =
@{
    Source = "c:\Users\FallenGameR\.vim\"
    Destination = ".vim"
},
@{
    Source = "c:\Users\FallenGameR\Desktop\"
    Destination = "Desktop"
},
@{
    Source = "c:\Users\FallenGameR\Documents\"
    Destination = "Documents"
},
@{
    Source = "d:\Downloads\"
    Destination = "Downloads"
},
@{
    Source = "d:\Dropbox\"
    Destination = "Dropbox"
},
@{
    Source = "d:\OneDrive\"
    Destination = "OneDrive"
},
@{
    Source = "d:\Pictures\"
    Destination = "Pictures"
},
@{
    Source = "d:\Music\"
    Destination = "Music"
},
@{
    Source = "d:\Videos\"
    Destination = "Videos"
},
@{
    Source = "d:\Archive\"
    Destination = "Archive"
}

NET USE "\\qnap\home\$env:USERNAME" /USER:admin admin
$destinationRoot = "\\qnap\home\$env:USERNAME\$env:COMPUTERNAME\2015-1st"
$creationNeeded = -not (Test-Path $destinationRoot)

foreach( $task in $tasks )
{
    $params = @()
    $params += "-a" # archive
    $params += "-v" # verbose
    $params += "--delete" # delete extraneous files from dest dirs
    $params += "--ignore-errors" # delete even if there are I/O errors
    $params += "--force" # force deletion of dirs even if not empty
    $params += "--human-readable" # output numbers in a human-readable format
    $params += "--itemize-changes" # output a change-summary for all updates
    $params += "--modify-window=1" # when transferring to or from an MS Windows FAT filesystem (which represents times with a 2-second resolution), --modify-window=1 is useful (allowing times to differ by up to 1 second).
    $params += "--stats" # print a verbose set of statistics on the file transfer, allowing you to tell how effective rsync's delta-transfer algorithm is for your data.
    $params += "--prune-empty-dirs" # tells the receiving rsync to get rid of empty directories from the file-list, including nested directories that have no non-directory children. This is useful for avoiding the creation of a bunch of useless directories when the sending rsync is recursively scanning a hierarchy of files using include/exclude/filter rules.
    $params += "/cygdrive/" + ($task.Source -replace ":" -replace "\\", "/")
    $params += ($destinationRoot -replace "\\", "/") + "/" + $task.Destination

    C:\tools\rsync\rsync.exe $params
}

