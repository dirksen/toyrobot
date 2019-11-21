import sys
import re
from enum import Enum
from collections import namedtuple


class Facing(Enum):
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3


Step = namedtuple("Step", "x y")
# Movement increment per direction.
MOVEMENTS = dict(EAST=Step(1, 0), WEST=Step(-1, 0), NORTH=Step(0, 1), SOUTH=Step(0, -1))


class InvalidInstruction(Exception):
    pass


class Robot:
    x = 0
    y = 0
    f = None

    placed_properly = False

    def simulate(self, instructions):
        """
        Take in a set of instructions, simulate the movement of toy robot
        according to the input, or raise InvalidInstruction if input is legal
        """
        instructions = instructions.strip()
        for instruction in instructions.split("\n"):
            instruction = instruction.strip()
            if not self.placed_properly:
                if instruction.startswith("PLACE"):
                    self.placed_properly = True
                else:
                    continue
            if re.match(r"PLACE [0-5],[0-5],(EAST|WEST|NORTH|SOUTH)$", instruction):
                _, params = instruction.split()
                self.place(params)
            elif re.match(r"(MOVE|LEFT|RIGHT|REPORT)$", instruction):
                command = instruction
                if command == "MOVE":
                    self.move()
                elif command in ("LEFT", "RIGHT"):
                    self.turn(command)
                elif command == "REPORT":
                    print(f"{self.x},{self.y},{self.f.name}")
            else:
                raise InvalidInstruction(f"Invalid command: {instruction}")

    def place(self, param):
        x, y, f = param.split(",")
        self.x = int(x)
        self.y = int(y)
        fn = Facing.__members__[f]
        self.f = Facing(fn)

    def move(self):
        x, y = MOVEMENTS[self.f.name]
        nx = self.x + x
        ny = self.y + y
        # check if the move is legal
        if 0 <= nx <= 5 and 0 <= ny <= 5:
            self.x = nx
            self.y = ny
        else:
            # ignore illegal move
            pass

    def turn(self, direction):
        direction = 1 if direction == "RIGHT" else -1
        self.f = Facing((self.f.value + direction) % 4)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python toyrobot.py <instruction-file>")
    else:
        instruction_file = sys.argv[1]
        with open(instruction_file, "r") as f:
            Robot().simulate(f.read())
