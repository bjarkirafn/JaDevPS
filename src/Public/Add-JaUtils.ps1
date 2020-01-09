function Add-JaUtils {
  param(
    [ArgumentCompleter( { 'all classes functions'.split(' ') })] $Type,
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Name
  )
  function addSymlink($pathName, $items) {
    $items |
      ForEach-Object {
        $splat = @{
          ItemType = 'SymbolicLink'
          Path     = ".\src\$pathName\jautils"
          Name     = $_.Name
          Target   = $_.FullName
          Force    = $True
        }
        New-Item @splat
      }
  }

  if ($Type -like 'Functions') { $Type = 'Private' }
  $root = get-item ..\jaUtilsPS\src

  if ($Type -like 'all') {
    'classes private'.split(' ') |
      ForEach-Object { addSymlink $_ (get-childitem $root\$_\jautils) }
    return
  }

  $root = Get-Item $root\$Type
  $Name | ForEach-Object { addSymlink $Type (Get-item $root\jautils\$_*) }

}


