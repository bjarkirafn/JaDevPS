function Convert-JaClipToSnippet {
  [Alias('javscClipToSnip')]
  [CmdletBinding()]
  param(
    [Parameter(Mandatory)]
    [string]$Prefix,
    [string]$Name,
    [string]$Language,
    [string[]]$Description
  )

  Get-Clipboard

}
