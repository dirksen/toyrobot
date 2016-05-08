# Class as interface definition - this isn't really
# a separate concern, but it's the interface between
# robot and table

class Location {
  [int]$X
  [int]$Y
  [boolean]$valid
  [string]$status
  
  Location([int]$X, [int]$Y) {
    $this.X = $X
    $this.Y = $Y
    $this.valid = $true
  }
  
  Location([string]$status) {
    $this.valid = $false
    $this.status = $status
  }
}