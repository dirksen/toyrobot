if (Get-Module -Name Table) {
  Remove-Module Table
}
Import-Module $PSScriptRoot\..\Table.psm1

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
    
    Context "::checkLocation" {
      BeforeEach {
        $t = [Table]::new()
      }
      It 'returns false for negative width' {
        $t.checkLocation(-1, 2) | should be $false
      }
      It 'returns false for negative height' {
        $t.checkLocation(3, -5) | should be $false
      }
      It 'returns true for 0, 0' {
        $t.checkLocation(0, 0) | should be $true
      }
      It 'returns true for max width' {
        $t.checkLocation(4, 2) | should be $true
      }
      It 'returns true for max height' {
        $t.checkLocation(3, 4) | should be $true
      }
      It 'returns false for over max width' {
        $t.checkLocation(5, 2) | should be $false
      }
      It 'returns false for over max height' {
        $t.checkLocation(3, 8) | should be $false
      }
      It 'returns true for max width and height together' {
        $t.checkLocation(4, 4) | should be $true
      }
    }
  }
}