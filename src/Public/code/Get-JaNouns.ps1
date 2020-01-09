function Get-JaNouns {
  return (get-module Ja*).ExportedCommands.Values |
    Where-Object { $_ -match '-' } |
    ForEach-Object { $_.Name.split('-')[1] -replace '^Ja','' } |
    sort-object -Unique
}
