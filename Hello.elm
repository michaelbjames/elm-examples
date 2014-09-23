-- Welcome to your first Elm program

-- Read up on syntax at http://elm-lang.org/learn/Syntax.elm

-- Learn about Elm's functions in the Catalog:
-- http://library.elm-lang.org/catalog/elm-lang-Elm/0.13.0/

helloWorld : Element
helloWorld = asText "Hello, World!"

welcomeGraphics : Element
welcomeGraphics =
    let dimensions = 90
        imgSize = 30
        elmLogo = image imgSize imgSize "http://elm-lang.org/logo.png"
        elmsPerSide = dimensions // imgSize
        row = flow right (repeat elmsPerSide elmLogo)
    in
        flow down (repeat elmsPerSide row)


main : Element
main =
    flow down [
        helloWorld,
        welcomeGraphics
        ]


