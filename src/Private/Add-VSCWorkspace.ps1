function Add-VSCWorkspace {
  param(
    [ArgumentCompleter( { 'workout packages'.split() })]
    [string]$Directory,
    [ArgumentCompleter( { $MyInvocation })]
    $test
  )

  $Directory
  $test

}
