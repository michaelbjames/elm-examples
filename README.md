# Elm Examples

A collection of simple Elm projects.

These projects are nice examples of Elm code that are great to learn from and
fun to play with in [Elm Reactor][reactor].

[reactor]: https://github.com/elm-lang/elm-reactor

## Get Set Up

First make sure you have [Elm Platform][platform] 0.13 or higher. The next
step is to clone this repo:

[platform]: https://github.com/elm-lang/elm-platform/

```shell
git clone https://github.com/michaelbjames/elm-examples.git
cd elm-examples
```

From there you need to build the TodoMVC example. This will make it possible
to open up `todo/todo.html` and see TodoMVC with the debugger:

```shell
cd todo
elm-get install
elm --make --only-js Todo.elm
cd ..
```

Finally, you can start the reactor from the root of this project and start
playing with the examples:

```shell
elm-reactor
```

The Reactor should be running at [http://localhost:8000][localhost]. Check it
out!

[localhost]: http://localhost:8000

## Notes

Be sure to look at `todo/todo.html`, not `todo/Todo.elm`. The Elm code uses
ports to communicate with JavaScript, so you need to run this program from the
HTML file which initializes everything properly.