$library_path = [Environment]::GetEnvironmentVariable("PMDK_LibraryPath","User")
Write-host $library_path
$include_path = [Environment]::GetEnvironmentVariable("PMDK_IncludePath","User")
Write-host $include_path
if ($env:target.Contains("msvc")) {
     Write-host "${env:LIB};$library_path"
     [Environment]::SetEnvironmentVariable("LIB", "$library_path", "User")
     [Environment]::SetEnvironmentVariable("INCLUDE", "$include_path", "User")
}
if ($env:target.Contains("gnu")) {
     Write-host "in gnu"
     [Environment]::SetEnvironmentVariable("LIBRARY_PATH", "${env:LIBRARY_PATH};$library_path", "User")
     [Environment]::SetEnvironmentVariable("C_INCLUDE_PATH", "${env:C_INCLUDE_PATH};$include_path", "User")
}
