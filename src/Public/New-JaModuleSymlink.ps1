function New-JaModuleSymlink {
  $path = Get-Item .\bin\*
  $POSH = ('Windows', '')[($PSVersionTable.PSVersion.Major -gt 5)] + 'Powershell'
  $modPath = get-item ~\documents\$POSH\modules
  New-Item -ItemType SymbolicLink -Path $modPath -Name $path.Name -Target $path -Force
}
