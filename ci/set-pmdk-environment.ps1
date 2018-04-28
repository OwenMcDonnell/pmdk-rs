$library_path = [Environment]::GetEnvironmentVariable("PMDK_LibraryPath","User")
Write-host $library_path
$include_path = [Environment]::GetEnvironmentVariable("PMDK_IncludePath","User")
Write-host $include_path
if ($env:target.Contains("msvc")) {
     [Environment]::SetEnvironmentVariable("LIB", "${env:LIB};$library_path", "User")
     [Environment]::SetEnvironmentVariable("INCLUDE", "${env:INCLUDE};$include_path", "User")
}
if ($env:target.Contains("gnu")) {
     [Environment]::SetEnvironmentVariable("LIBRARY_PATH", "${env:LIBRARY_PATH};$library_path", "User")
     [Environment]::SetEnvironmentVariable("C_INCLUDE_PATH", "${env:C_INCLUDE_PATH};$include_path", "User")
}
