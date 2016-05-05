class Table {
  # Property: Max width starting at 0
  [int]$maxX
  # Property: Max height starting at 0
  [int]$maxY
  
  Table() {
    $this.maxX = 4
    $this.maxY = 4
  }

  Table([int]$width, [int]$height) {
    $this.maxX = $width-1
    $this.maxY = $height-1
  }
  
  [boolean]checkLocation([int]$x, [int]$y) {
    return (0 -le $x -and $x -lt $this.maxX) `
      -and (0 -le $y -and $y -lt $this.maxY)
  }
  
  [int]width() {
    return $this.maxX + 1
  }
  
  [int]height() {
    return $this.maxY + 1
  }
}