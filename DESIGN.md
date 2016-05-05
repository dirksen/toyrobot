Thoughts on design:

Breaking this into concerns, there are the following:

* Location - 5 x 5 valid locations plus "not yet placed"
* Facing
* Command validity (syntax)
* Command validity (has been placed)
* Command validity (will cause fall off table)
* Retention of state (robot position and facing)

Things we need to do:

* Read a command
* Verify syntax
* Check for capability (positioning)
* Alter robot's state
* Rinse, repeat

The nice thing about this exercise is there are many many ways to structure this.
This repository aims to investigate some via different languages. Also, to help
try out various testing frameworks - because this project is highly suited to unit
testing.

Part of the trick here is the requirements are small - the typical next exercise
should be "now refactor in this way", where the "this" is unknown at time of
writing. These become interesting thought exercises to stretch the design.