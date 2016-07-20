# Command Line Connect Four

This game was built using TDD  
[RSpec Documentation](https://relishapp.com/rspec)

## Gameplay and Rules
```
 ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗ ██████╗████████╗    ██╗  ██╗
██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝    ██║  ██║
██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██║        ██║       ███████║
██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║        ██║       ╚════██║
╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗╚██████╗   ██║            ██║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝            ╚═╝

  1   2   3   4   5   6   7
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ ◉ │ ◯ │ · │ · │ · │
└───┴───┴───┴───┴───┴───┴───┘

» GAME RULES
» Player 1 game piece: ◉
» Player 2 game piece: ◯
» Players drop their token by typing in a column number
» 4 marks in a row wins
```
  
## Installation
```
$ gem install colorize
```
* [Colorize gem](https://github.com/fazibear/colorize) used to color strings

## Screenshot of Gameplay
![alt tag](https://raw.githubusercontent.com/jeanpaulsio/ruby-exercises/master/10_connectfour/lib/gameplay.jpg)

  
This implementation of [Connect Four](https://en.wikipedia.org/wiki/Connect_Four) lets you play against the computer on the command line.