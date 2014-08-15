elm-examples
======================

Welcome to the starter kit!

Let's get to playing around with Elm and it's interactive debugger.

--

### Do you trust me?
```shell
curl https://raw.githubusercontent.com/michaelbjames/elm-examples/master/setup.sh | bash
```
Now run `../elm-reactor/dist/build/elm-reactor/elm-reactor` to get started.

--

If not, here's how we'll get set up.

#### Before we do anything:
```shell
mkdir elm-starter-kit
cd elm-starter-kit
```

#### Now let's get the latest from the repos we need:
```shell
git clone git@github.com:elm-lang/Elm.git
git clone git@github.com:elm-lang/elm-reactor.git
git clone git@github.com:michaelbjames/elm-examples.git
```

#### Next we need to build each
##### elm
```shell
cd elm
cabal sandbox init
cabal install --only-dependencies; cabal configure; cabal build; cabal install
```
##### elm-reactor
```shell
cd ../elm-reactor
cabal sandbox init
cabal sandbox add-source ../elm
cabal install --only-dependencies; cabal configure; cabal build; cabal install
```
##### elm-examples
```shell
cd ../elm-examples/todo
elm --make --only-js Todo.elm
cd ..
```

### Let's try it out!
```shell
../elm-reactor/dist/build/elm-reactor/elm-reactor
```

