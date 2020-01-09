@(
  , ('Add-JaUtils', 'Name', {

      $logFile = 'c:\temp\log'
      $wordToComplete = $args[2]

      $cmdName, $paramName, $arguments = $args[3].commandElements.value

      if ($paramName -notlike 'all') {
        if ($paramName -like 'Functions') { $paramName = 'Private' }

        $values = (get-childitem ..\jaUtilsPS\src\$paramName\jautils).BaseName |
          Where-Object { $_ -notin $arguments }

        $msg = $cmdName, $paramName, $arguments, $values, $wordToComplete
        $msg > $logFile

        $values |
          Where-Object { $_ -like "*$wordToComplete*" } |
          ForEach-Object { [System.Management.Automation.CompletionResult]::new($_) }
      }
    }
  )
) |
  ForEach-Object {

    $splat = @{
      CommandName   = $_[0]
      ParameterName = $_[1]
      ScriptBlock   = $_[2]
    }
    Register-ArgumentCompleter @splat
  }

