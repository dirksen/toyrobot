Table - a set of valid locations, and functions to generate same
TableLocation - a class to hold valid and invalid locations
Robot - a thing that exists at a location

This is a vaguely functional approach - no mutables, instead we're
passing TableLocations around and generating new ones.

We are constrained by Powershell to only having return types that are
defined in our existing file, and not exporting class definitions from
modules (same basic restriction)

Trying to minimise the ties through TableLocation - there is a knowledge
of the structure of the TableLocation built into Table (in checkLocation)