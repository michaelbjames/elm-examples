# Elm Examples

A collection of simple Elm projects.

These projects are nice examples of typical Elm code *and*
are fun to play with in [Elm Reactor][reactor].

[reactor]: https://github.com/elm-lang/elm-reactor

## Get Set Up

#### The Easy Way

If you have `curl` and  `bash` you can get setup by running [this script][setup]
with the following commands. It will set up a directory named `elm-starter-kit`
that has everything you need to get started!

[setup]: https://github.com/michaelbjames/elm-examples/blob/master/setup.sh

```shell
curl https://raw.githubusercontent.com/michaelbjames/elm-examples/master/setup.sh | bash
cd elm-starter-kit/elm-examples
../elm-reactor/dist/build/elm-reactor/elm-reactor
```

After that the Reactor should be running at [http://localhost:8000](http://localhost:8000).
Check it out!

#### The Hard Way

If you don't want to run a script from the internet or just cannot run it,
follow these instructions:

Create a directory to play around in:

```shell
mkdir elm-starter-kit
cd elm-starter-kit
```

Elm Reactor is not available with Elm Platform yet, so for now we need
to build from source. First we need to build the latest version of the
compiler:

```shell
git clone git@github.com:elm-lang/Elm.git
cd elm
cabal sandbox init
cabal install -j && cabal build
cd ..
```

Now we can build the Reactor:

```shell
git clone git@github.com:elm-lang/elm-reactor.git
cd elm-reactor
cabal sandbox init
cabal sandbox add-source ../elm
cabal install -j && cabal build
cd ..
```

Finally we can clone *this* repo and build the Todo example:

```shell
git clone git@github.com:michaelbjames/elm-examples.git
cd elm-examples/todo
elm --make --only-js Todo.elm
```

And finally we can get started with the examples! Start the reactor
from the `elm-examples` directory:

```shell
cd ..
../elm-reactor/dist/build/elm-reactor/elm-reactor
```

The Reactor should be running at [http://localhost:8000](http://localhost:8000).
Check it out!
