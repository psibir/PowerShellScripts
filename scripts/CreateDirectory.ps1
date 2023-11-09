
param(
    [string]$outputDirectory,
    [int]$lastNumber
)

# Check if the output directory exists, if not, create it
if (-not (Test-Path -Path $outputDirectory -PathType Container)) {
    New-Item -Path $outputDirectory -ItemType Directory
}

for ($i = 1; $i -le $lastNumber; $i++) {
    $dirName = "Row_{0:D3}" -f $i
    $dirPath = Join-Path -Path $outputDirectory -ChildPath $dirName
    New-Item -Path $dirPath -ItemType Directory
}
