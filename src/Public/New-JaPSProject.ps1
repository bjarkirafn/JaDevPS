
function New-JaPSProject {
  param(
    [ArgumentCompleter( { & { (Get-ChildItem $PSScriptRoot\templates).name } })]$PlasterTemplate = 'PSModule',
    [boolean]$UseDefault = $true
  )

  $popd = $false

  $plasterParams = @{
    TemplatePath    = Join-Path $PSScriptRoot\templates $PlasterTemplate
    DestinationPath = "$pwd"
  }

  if ((Get-ChildItem .).count -eq 0) {
    $plasterParams.Add('ModuleName', (Get-item .).Name)
    $description = "A soon to be description for $($plasterParams.ModuleName)"
    $plasterParams.Add('ModuleDescription', $description)
    $plasterParams.DestinationPath = Split-Path "$Pwd"
    Push-Location $plasterParams.DestinationPath
    $popd = $true
  }


  if ($UseDefault) {
    $plasterStores = Get-ChildItem $env:LOCALAPPDATA\plaster
    $StoredDefaults = $plasterStores.Where( { $_.name -match $PlasterTemplate })

    if ($StoredDefaults) {
      $defaults = Get-PlasterDefaults $PlasterTemplate $StoredDefaults
      if ($defaults) {
        $defaults.getenumerator() | ForEach-Object { $plasterParams.Add($_.Key, $_.Value) }
      }
    }
  }

  Invoke-Plaster @plasterParams | Out-Null

  if ($popd) { Pop-Location }

}




