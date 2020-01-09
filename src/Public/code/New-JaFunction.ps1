function New-JaFunction {
  [Alias('janewfunc')]
  [CmdletBinding()]
  param(
    [Parameter(Mandatory)]
    [ArgumentCompleter( {
        $w = $args[2]
        Get-JaNouns |
          Where-Object { $_ -like "$w*" } |
          ForEach-Object { [system.management.automation.completionresult]::new($_) }
      })]$Noun,
    [ArgumentCompleter( {
        $w = $args[2]
        Get-Verb |
          Where-Object { $_ -like "$w*" } |
          ForEach-Object { [system.management.automation.completionresult]::new($_) }
      })]$Verb
  )




}
