@{
    Path = "<%=$PLASTER_PARAM_ModuleName%>.psd1"
    OutputDirectory = "..\bin\<%=$PLASTER_PARAM_ModuleName%>"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    Symlinks = @{
        Classes = ''
        Private = ''
        Public  = ''
    }
    PublicFilter = 'Public\*.ps1'
    CopyDirectories = @()
    VersionedOutputDirectory = $true
}
