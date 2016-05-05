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
  }
}