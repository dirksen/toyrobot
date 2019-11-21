import pytest
from toyrobot import Robot, InvalidInstruction


def test1(capsys):
    instructions = """
        PLACE 0,0,NORTH
        MOVE
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "0,1,NORTH", "Example 1 failed"


def test2(capsys):
    instructions = """
        PLACE 0,0,NORTH
        LEFT
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "0,0,WEST", "Example 2 failed"


def test3(capsys):
    instructions = """
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "3,3,NORTH", "Example 3 failed"


def test_overboundary(capsys):
    instructions = """
        PLACE 0,0,WEST
        MOVE
        MOVE
        LEFT
        MOVE
        LEFT
        MOVE
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "1,0,EAST", "Failed boundary test"


def test_overboundary2(capsys):
    instructions = """
        PLACE 5,5,EAST
        MOVE
        LEFT
        MOVE
        LEFT
        MOVE
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "4,5,WEST", "Failed boundary test 2"


def test_proper_start(capsys):
    instructions = """
        MOVE
        RIGHT
        PLACE 5,5,EAST
        REPORT
    """
    robot = Robot()
    robot.simulate(instructions)
    captured = capsys.readouterr()
    assert captured.out.strip() == "5,5,EAST", "Failed finding the starting instruction"


def test_incorect_placement(capsys):
    instructions = """
        PLACE 6,6,EAST
        REPORT
    """
    robot = Robot()
    with pytest.raises(InvalidInstruction):
        robot.simulate(instructions)


def test_invalid_instruction(capsys):
    instructions = """
        PLACE
        REPORT
    """
    robot = Robot()
    with pytest.raises(InvalidInstruction):
        robot.simulate(instructions)
