# Bored

This is a simple example gem developed for the conference talk ["How to make a
gem of a gem"](https://rubyconf.org/program/sessions#session-1203) at
[RubyConf](https://rubyconf.org) 2021.

The Bored gem calls the [Bored API](https://www.boredapi.com) and returns random
activity ideas.

## Installation

The installation process is boring, but familiar!

```ruby
$ gem install bored
```

## Usage

### CLI

Once installed, run:

```
$ bored
```

And an activity will be printed. That's it!

### API

To invoke the gem programmatically, just call:

```ruby
Bored.now
```

This will return an
[Activity](https://github.com/testdouble/bored/blob/main/lib/bored.rb#L11-L15)
object.

## Code of Conduct

This project follows Test Double's [code of
conduct](https://testdouble.com/code-of-conduct) for all community interactions,
including (but not limited to) one-on-one communications, public posts/comments,
code reviews, pull requests, and GitHub issues. If violations occur, Test Double
will take any action they deem appropriate for the infraction, up to and
including blocking a user from the organization's repositories.
