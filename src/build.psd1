@{
    Path = "jaDevPS.psd1"
    OutputDirectory = "..\bin\jaDevPS"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    CopyDirectories = 'Templates', 'scripts'
    VersionedOutputDirectory = $true

}

