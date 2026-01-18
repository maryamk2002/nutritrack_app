# PowerShell script to set up Android SDK without Android Studio
# 1. Download the command line tools zip from:
#    https://developer.android.com/studio#command-tools
#    (Choose Windows, save as commandlinetools-win-*.zip)
# 2. Place this script in the same folder as the downloaded zip, or edit the $zipPath variable below.

$zipPath = "commandlinetools-win-*.zip"  # Edit if needed
$androidRoot = "C:\Android"
$cmdlineTools = "$androidRoot\cmdline-tools\latest"

# Create directories
New-Item -ItemType Directory -Force -Path $cmdlineTools | Out-Null

# Extract zip
Expand-Archive -Path $zipPath -DestinationPath $cmdlineTools -Force

# Move contents up if needed
$inner = Get-ChildItem "$cmdlineTools\cmdline-tools" -ErrorAction SilentlyContinue
if ($inner) {
    Move-Item "$cmdlineTools\cmdline-tools\*" $cmdlineTools -Force
    Remove-Item "$cmdlineTools\cmdline-tools" -Recurse -Force
}

# Set environment variables
[System.Environment]::SetEnvironmentVariable("ANDROID_HOME", $androidRoot, [System.EnvironmentVariableTarget]::User)
$env:Path += ";$cmdlineTools\bin;$androidRoot\platform-tools"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User)

# Install SDK components
& "$cmdlineTools\bin\sdkmanager.bat" "platform-tools" "platforms;android-34" "build-tools;34.0.0"

Write-Host "Android SDK setup complete. Restart your terminal and run 'flutter doctor' again."