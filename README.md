elm-examples
======================

Welcome to the starter kit!

Let's get to playing around with Elm and it's interactive debugger.

Before we do anything:
```shell
mkdir elm-starter-kit
cd elm-starter-kit
```

First, we need the latest copy of elm and the reactor (the new debugger)
```shell
git clone git@github.com:elm-lang/Elm.git
git clone git@github.com:elm-lang/elm-reactor.git
git clone git@github.com:michaelbjames/elm-examples.git
```

Next we need to build each
```shell
cd elm
cabal sandbox init
cabal install --only-dependencies; cabal configure; cabal build; cabal install
```
```shell
cd ../elm-reactor
cabal sandbox init
cabal sandbox add-source ../elm
cabal install --only-dependencies; cabal configure; cabal build; cabal install
```
```shell
cd ../elm-examples/todo
elm --make --only-js Todo.elm
cd ..
../elm-reactor/dist/build/elm-reactor/elm-reactor
```

Let's try it out!

