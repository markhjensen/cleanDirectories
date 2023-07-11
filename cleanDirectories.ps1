# Set one or more paths to delete directories (Default Downloads)
$pathList = [String[]]@(
    "C:\Users\$env:username\Downloads\"
)
# Set number of days to go back and delete files (Default 7)
$days = 0

function deleteFilesInPath {
    param (
        [string]$deletePath
    )
    
    $fileList = Get-ChildItem -Path $path
    foreach ($file in $fileList) {
        if ($file.LastWriteTime -lt (Get-Date).AddDays(-1 * $days)) {
            Write-Host "Deleting: $file ($file.LastWriteTime)"
            $file | Remove-Item -Recurse -Force
        }
    }
}

foreach ($path in $pathList) {
    deleteFilesInPath -deletePath $path
}
