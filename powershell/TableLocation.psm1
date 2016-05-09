# Class as interface definition - this isn't really
# a separate concern, but it's the interface between
# robot and table

class TableLocation {
  [int]$X
  [int]$Y
  [boolean]$valid
  [string]$status
  
  TableLocation([int]$X, [int]$Y) {
    $this.X = $X
    $this.Y = $Y
    $this.valid = $true
  }
  
  TableLocation([string]$status) {
    $this.valid = $false
    $this.status = $status
  }
}

function Get-TableLocation([int]$X, [int]$Y, [string]$status) {
  if ($status -eq $null) {
    return [TableLocation]::new($status)
  }
  return [TableLocation]::new($X, $Y)
}

Export-ModuleMember -Function Get-TableLocation