# CreateDirectory.ps1

# Create directories with names like "Row_001," "Row_002," and so on, in the specified output directory, up to the last number you specified.

# HOW TO USE
# Navigate to the directory that contains the 'CreateDirectory.ps1' script
# Run the script with the following command, providing the desired output directory path and the last number to be incremented as arguments:

#    ```powershell
#    .\CreateDirectories.ps1 -outputDirectory "C:\Path\To\Output\Directory" -lastNumber 10
#    ```

# Replace `"C:\Path\To\Output\Directory"` with the path to the directory where you want to create the incremental directories, and `10` with the last number to be incremented. Adjust these values to your specific requirements.


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
