if (Get-Module -Name TableLocation) {
  Remove-Module TableLocation
}
Import-Module $PSScriptRoot\..\TableLocation.psm1

Describe "TableLocation class" {
  InModuleScope TableLocation {
    It "Instantiates with X and Y location" {
      $l = [TableLocation]::new(4, 5)
      $l.X | should be 4
      $l.Y | should be 5
      $l.valid | should be $true
    }
    
    It "Instantiates with an error message" {
      $l = [TableLocation]::new("This is an invalid location")
      $l.valid | should be $false
      $l.status | should be "This is an invalid location"
    }
    
    It "Returns coordinates when it has them" {
      $l = [TableLocation]::new(4, 5)
      $l.coordinates | should be (4, 5)
    }
  }
}