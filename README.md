# Implementing Tic Tac Toe Game with Ruby

This project is to demonstrate our knowledge of Object Oriented Programming Language in Ruby, building a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

![screenshot](./screenshot.png)

# About the Game - Tic-Tac-Toe

According to [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe#:~:text=Tic%2Dtac%2Dtoe%20American,diagonal%20row%20is%20the%20winner.) Tic-tac-toe (American English), noughts and crosses (British English), or Xs and Os is a paper-and-pencil game for two players, X and O, who take turns marking the spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner...[readmore](https://en.wikipedia.org/wiki/Tic-tac-toe#:~:text=Tic%2Dtac%2Dtoe%20American,diagonal%20row%20is%20the%20winner.)

# User Interface

The game starts by calling the bin/main.rb file where all other classes are called/required. The game is played on the **CLI**

# Game Instructions

Tic-Tac-Toe is a famous game where the aim is to have 3 consecutive tokens aligned vertically, horizontally or diagonally. For those who are new to the game these are the rules governing the game:

-   In this game, not more than 2 players are allowed
-   The players should enter their names
-   The first player has to choose between the tokens X and O
-   The players have to note that other tokens other than X and O are considered as invalid
-   If the first player chooses "X" then the other player will automatically be assigned the token "O"
-   The 3x3 board appears with numbers from 1-9 and players have to place their respective tokens inside the board
-   The winner is the person who has aligned 3 consecutives token vertically, horizontally or diagonally

# Class Definitions

### **Player Class**:

Will interact with Board class to select where to place pieces
Pieces placed will be represented by X or O

# Live Demo

[![Run on Repl.it](https://repl.it/badge/github/enkog/tic-tac-toe)](https://tic-tac-toe.enkog.repl.run/)

## Built With

-   Ruby

# Getting Started

To get a local copy of the repository please run the following commands on your terminal:

```
$ cd <folder>
```

```
$ git clone https://github.com/enkog/tic-tac-toe.git
```

**To run the code:**

```bash
$ bin/main.rb
```

#### Testing

##### Install Rspec

```bash
$ gem install rspec
```

To test the code, run `rspec` from root of the folder using terminal.

> Rspec is used for the test.

## Authors

👤 **Kamwa Emmanuelle Alix**

-   Github: [@emmanuellekamwa](https://github.com/emmanuellekamwa)
-   Twitter: [@AlixKamwa](https://twitter.com/AlixKamwa)
-   Linkedin: [@emmanuelle-kamwa](https://linkedin.com/in/emmanuelle-kamwa-86145a1a4/)

👤 **Oguadinma Nkiruka Ngozika**

-   Github: [@enkog](https://github.com/enkog)
-   Linkedin: [@enkog](https://www.linkedin.com/in/enkog/)
-   Twitter: [@enkodes](https://twitter.com/enkodes)

## Contributing

Contributions, issues and feature requests are welcome!
Feel free to check the [issues page](issues/).

## Show your support

Give a star if you like this project!

License

This project is [MIT](lic.url) licensed.)
