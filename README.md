# PAWN Simulator

8 * 8 CHART

## Description

The application that can read in commands of the following form:

    PLACE X,Y,F,C
    MOVE X
    LEFT
    RIGHT
    REPORT

## Requirements

- Ruby 3.0.0

- Libraries: Bundler, rspec


## Dependencies, Test and Run

- Dependencies: `bundle install`

- Test: `rspec spec/`

- Run: `ruby start_game.rb`

## Example:

a)

    PLACE 0,0,NORTH,WHITE
    MOVE 1
    REPORT


    Output: 0,1,NORTH,WHITE
