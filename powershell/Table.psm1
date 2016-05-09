class Table {
  # Property: Max width starting at 0
  hidden [int]$maxX
  # Property: Max height starting at 0
  hidden [int]$maxY
  
  Table() {
    $this.maxX = 4
    $this.maxY = 4
  }

  Table([int]$width, [int]$height) {
    $this.maxX = $width - 1
    $this.maxY = $height - 1
  }
  
  [int]width() {
    return $this.maxX + 1
  }
  
  [int]height() {
    return $this.maxY + 1
  }
  
  hidden [boolean]checkCoordinates([int]$x, [int]$y) {
    return (0 -le $x -and $x -le $this.maxX) `
      -and (0 -le $y -and $y -le $this.maxY)
  }
  
  [boolean]checkTableLocation($location) {
    return $this.checkCoordinates($location.coordinates[0], $location.coordinates[1])
  }
}

function Get-Table() {
  return [Table]::new()
}

function Get-Table([int]$width, [int]$height) {
  return [Table]::new($width, $height)
}


Export-ModuleMember -Function Get-Table