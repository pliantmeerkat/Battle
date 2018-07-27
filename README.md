# Battle

This repo contains the files nescesary to buid or add to my brwser based application *battle* all files/ gems are required to run the program, if any gems are missing from your machine follow the instructions below.

## Installation

to install the application simply clone/ fork this repo, then run **git clone** in your terminal of choice at a location of your choice.
The tests used in this application use the *rspec* library. this must be installed onto your machine **if you wish to add to the source code**. to do this follow the instructions on the [rspec github page](https://github.com/rspec/rspec)
All gems found in the gemfile are required, simply inbstall them using bundle, if you do not have bundle it can be found [here](https://github.com/bundler/bundler)

## Testing

in order to run the tests found in the *spec* directory run rspec into cmd/ terminal. you should see an output like this:

```
    COVERAGE:  98.95% -- 376/380 lines in 17 files

    +----------+-------------+-------+--------+--------------+
    | coverage | file        | lines | missed | missing      |
    +----------+-------------+-------+--------+--------------+
    |  91.67%  | lib/game.rb | 48    | 4      | 34-35, 66-67 |
    +----------+-------------+-------+--------+--------------+
    16 file(s) with 100% coverage not shown
    Coverage report generated for RSpec to /Users/jackbranch/Desktop/Makers Course Files/Week 3/Battle/coverage. 376 / 380 LOC (98.95%) covered.
    Jacks-MacBook-Pro:Battle jackbranch$
```

the tests are divided up into two main locations, unit tests in ./spec and all capybara based feature tests in ./spec/features.

## Usage

To run the apllication enter the following command into cmd/terminal

```
    Jacks-MacBook-Pro:Battle jackbranch$ ruby app.rb
```

you should then see confirmation from sinatra that the application has loaded like so:

```
    == Sinatra (v2.0.3) has taken the stage on 4567 for development with backup from Puma
    Puma starting in single mode...
    * Version 3.12.0 (ruby 2.5.1-p57), codename: Llamas in Pajamas
    * Min threads: 0, max threads: 16
    * Environment: development
    * Listening on tcp://localhost:4567

```

then boot up your browser of choice and enter *localhost:* followed by the port number assigned, 4567 in the one above. you should then be greeted with the main game screen

## Instructions

The game is simple, simply choose an attack, then click *attack* to confim your move. The game will then redirect you to a screen showing your inflicted damage, as well as any other attack related infomation. When any player's health falls below zero the game will end. a new game can then be started.

## Attack Types

There are four main attack types:

    - Power Attack: Does higher than base damage with a chance of stunning your opponent
    - Swift Attack: Does lower damage but has less chance of low damage attacks
    - Ranged Attack: Does very high potential damage and can cause bleeding but 25% chance of missing and inflicting 0 damage
    - Defensive Move: Lowest attack value but guarentees that a random percentage of the inflicted damage will be added to the attacker's hit points

## Screenshots

## Credits

Project Idea/ teplate - Makers Academy
Age of Empires 2 - intro music and images
Red alert 2 Theme - Main battle music
