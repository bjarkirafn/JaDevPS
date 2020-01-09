function Get-PlasterDefaults {
  param([string]$PlasterTemplate, [string]$StorePath)
  $result = $null
  $path = "$PSScriptRoot\templates\$PlasterTemplate\options.psd1"

  if (Test-Path $path) {
    $result = @{ }
    $plasterOptions = Import-PowerShellDataFile $path
    $Store = Import-Clixml $StorePath

    $Store.getenumerator() |
      ForEach-Object {
        $key, $val = $_.Key, $_.Value

        if ($val -match '^\d{1}$') {
          $val = $plasterOptions.$key[[int]$val]

        } elseif ($val -match '\d,') {
          $regex = [regex]'\d'
          $val = $regex.Matches($val).value |
            ForEach-Object {
              $index = [int]$_
              $plasterOptions.$key[$index]
            }
        }
        $result.Add($key, $val)
      }


  }
  return $result

}
