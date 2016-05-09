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
    
    Context "::checkTableLocation" {
      BeforeEach {
        $t = [Table]::new()
      }
      It 'returns false for negative width' {
        $t.checkTableLocation($(Get-TableLocation -X -1 -Y 2)) | should be $false
      }
      It 'returns false for negative height' {
        $t.checkTableLocation($(Get-TableLocation -X 3 -Y -5)) | should be $false
      }
      It 'returns true for 0, 0' {
        $t.checkTableLocation($(Get-TableLocation -X 0 -Y 0)) | should be $true
      }
      It 'returns true for max width' {
        $t.checkTableLocation($(Get-TableLocation -X 4 -Y 2)) | should be $true
      }
      It 'returns true for max height' {
        $t.checkTableLocation($(Get-TableLocation -X 3 -Y 4)) | should be $true
      }
      It 'returns false for over max width' {
        $t.checkTableLocation($(Get-TableLocation -X 5 -Y 2)) | should be $false
      }
      It 'returns false for over max height' {
        $t.checkTableLocation($(Get-TableLocation -X 3 -Y 8)) | should be $false
      }
      It 'returns true for max width and height together' {
        $t.checkTableLocation($(Get-TableLocation -X 4 -Y 4)) | should be $true
      }
    }
  }
}