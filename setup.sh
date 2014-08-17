#!/bin/bash

if [ -a elm-starter-kit ]
    then
        echo "Looks like you've already run this."
        echo "\`rm -rf elm-starter-kit\` and try again."
        exit 1
fi

mkdir elm-starter-kit
cd elm-starter-kit

git clone https://github.com/elm-lang/Elm.git
git clone https://github.com/elm-lang/elm-reactor.git
git clone https://github.com/michaelbjames/elm-examples.git


status=0

echo "Creating sandbox in elm-starter-kit..."
cabal sandbox init --sandbox .
status=$?
if [ $status -gt 0 ]
    then
        echo "\`cabal sandbox init\` failed, do you have the lastest cabal?"
        exit $status
fi

cd Elm
cabal sandbox init --sandbox ..
cabal install -j && cabal build
status=$?
if [ $status -gt 0 ]
    then
        echo "Installing elm failed, please email the list with the error!"
        exit $status
fi


cd ../elm-reactor
echo "Installing elm-reactor in a sandbox"
cabal sandbox init --sandbox ..
cabal install -j && cabal build

status=$?
if [ $status -gt 0 ]
    then
        echo "Installing elm-reactor failed, please email the list with the error!"
        exit $status
fi

cd ../elm-examples/todo
elm --make --only-js Todo.elm

echo "Setup complete."
echo ""
echo ""
echo "Please run:"
echo "export PATH=\$(pwd)/elm-starter-kit/bin/:\$PATH"
echo "cd elm-examples"
echo "elm-reactor"
