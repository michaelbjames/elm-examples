#!/bin/bash

if [ -a elm-starter-kit ]
    then
        echo "Looks like you've already run this."
        echo "\`rm -rf elm-start-kit\` and try again."
        exit 1
fi

mkdir elm-starter-kit
cd elm-starter-kit

git clone git@github.com:elm-lang/Elm.git
git clone git@github.com:elm-lang/elm-reactor.git
git clone git@github.com:michaelbjames/elm-examples.git


status=0

cd elm
echo "Installing elm in the sandbox"
cabal sandbox init
status=$(($?+$status))
if [ $status -gt 0 ]
    then
        echo "\`cabal sandbox init\` failed, do you have cabal sandbox?"
        exit $status
fi

cabal install -j
status=$(($?+$status))
if [ $status -gt 0 ]
    then
        echo "Installing elm failed, please email the list with the error!"
        exit $status
fi

cd ../elm-reactor
echo "Installing elm-reactor in a sandbox"
cabal sandbox init
cabal sandbox add-source ../elm
cabal install -j

status=$(($?+$status))
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
echo "cd elm-starter-kit/elm-examples"
echo "../elm-reactor/dist/build/elm-reactor/elm-reactor"
