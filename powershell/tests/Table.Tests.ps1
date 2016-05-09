if (Get-Module -Name Table) {
  Remove-Module Table
}
Import-Module $PSScriptRoot\..\Table.psm1
Import-Module $PSScriptRoot\..\TableLocation.psm1

Describe "Table class" {
  InModuleScope Table {
    It 'instantiates with no args' {
      [Table]::new()
    }
    
    It 'defaults to width 5, height 5' {
      $t = [Table]::new()
      $t.width() | should be 5
      $t.height() | should be 5
    }
    
    It 'takes width and height in constructor' {
      $t = [Table]::new(3, 4)
      $t.width() | should be 3
      $t.height() | should be 4
    }
    
    Context "::checkCoordinates" {
      BeforeEach {
        $t = [Table]::new()
      }
      It 'returns false for negative width' {
        $t.checkCoordinates(-1, 2) | should be $false
      }
      It 'returns false for negative height' {
        $t.checkCoordinates(3, -5) | should be $false
      }
      It 'returns true for 0, 0' {
        $t.checkCoordinates(0, 0) | should be $true
      }
      It 'returns true for max width' {
        $t.checkCoordinates(4, 2) | should be $true
      }
      It 'returns true for max height' {
        $t.checkCoordinates(3, 4) | should be $true
      }
      It 'returns false for over max width' {
        $t.checkCoordinates(5, 2) | should be $false
      }
      It 'returns false for over max height' {
        $t.checkCoordinates(3, 8) | should be $false
      }
      It 'returns true for max width and height together' {
        $t.checkCoordinates(4, 4) | should be $true
      }
    }
  }
}