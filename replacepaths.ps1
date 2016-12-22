param (
    [string]$OSGeoFolder = "OSGeo4W64"
 )

$base = $PSScriptRoot + "\" + $OSGeoFolder
$binfolder = $base + "\bin"

Get-ChildItem $binfolder -Filter *.bat | 
Foreach-Object {
    Write-Host "Fixing" $_.FullName
    (Get-Content $_.FullName).replace($base, '%~do0..') | Set-Content $_.FullName
}