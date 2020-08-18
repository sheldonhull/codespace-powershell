#Synposis: Using dotnet tools (which is assumed to be in the base image), install gitversion for automatic version tagging based on git commit history
task bootstrap-gitversion {
    dotnet tool install --global GitVersion.Tool
    $ENV:PATH="$ENV:PATH:/home/codespace/.dotnet/tools"
    [string]$DotNetTools = @'
    # Add .NET Core SDK tools
    export PATH="$PATH:/home/codespace/.dotnet/tools"
'@
    $DotNetTools | Out-File -Path ~/.profile -Force -Append -ErrorAction SilentlyContinue
    $DotNetTools | Out-File -Path ~/.bashrc -Force -Append -ErrorAction SilentlyContinue

}
