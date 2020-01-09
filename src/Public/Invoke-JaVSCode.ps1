function Invoke-JaVSCode {
  param(
    [ArgumentCompleter( { 'add set get run'.split(' ') })]
    [string]$Command,
    [ArgumentCompleter( { $MyInvocation })]
    $invoked
  )

  $Command
  $invoked

}
