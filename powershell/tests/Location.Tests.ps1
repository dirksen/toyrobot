if (Get-Module -Name Location) {
  Remove-Module Location
}
Import-Module $PSScriptRoot\..\Location.psm1

Describe "Location class" {
  InModuleScope Location {
    It "Instantiates with X and Y location" {
      $l = [Location]::new(4, 5)
      $l.X | should be 4
      $l.Y | should be 5
      $l.valid | should be $true
    }
    
    It "Instantiates with an error message" {
      $l = [Location]::new("This is an invalid location")
      $l.valid | should be $false
      $l.status | should be "This is an invalid location"
    }
  }
}