@{
    Path = "JaDevPS.psd1"
    OutputDirectory = "..\bin\JaDevPS"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    CopyDirectories = 'Templates', 'scripts'
    VersionedOutputDirectory = $true

}

