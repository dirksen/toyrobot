if (Get-Module -Name Robot) {
  Remove-Module Robot
}
Import-Module $PSScriptRoot\..\Robot.psm1

