$library_path = [Environment]::GetEnvironmentVariable("PMDK_LibraryPath",[System.EnvironmentVariableTarget]::User)
Write-host $library_path
$include_path = [Environment]::GetEnvironmentVariable("PMDK_IncludePath",[System.EnvironmentVariableTarget]::User)
Write-host $include_path
if ($env:target.Contains("msvc")) {
     Write-host "in msvc"
     [Environment]::SetEnvironmentVariable("LIB", "$library_path", [System.EnvironmentVariableTarget]::Process)
     [Environment]::SetEnvironmentVariable("INCLUDE", "$include_path", [System.EnvironmentVariableTarget]::Process)
}
if ($env:target.Contains("gnu")) {
     Write-host "in gnu"
     [Environment]::SetEnvironmentVariable("LIBRARY_PATH", "${env:LIBRARY_PATH};$library_path", "Process")
     [Environment]::SetEnvironmentVariable("C_INCLUDE_PATH", "${env:C_INCLUDE_PATH};$include_path", "Process")
}
