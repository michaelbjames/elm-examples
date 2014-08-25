-- Welcome to your first Elm program!
-- Let's go through some basic syntax to get you up to speed.

-- This is how you assign a value or function to a name
introString : String
introString = "Hello, World!"

{- Function application works without parentheses. It's left associative.

Elements are Elm's graphical unit. On the highest level, an Elm program
is a manipulation of Elements which go out to screen.
-}
helloWorld : Element
helloWorld = asText introString    -- asText : anything -> Element


{- Let-expressions are indentation sensative, you can set temporary
values that can be used anywhere in the let-expression. The expression
following 'in' is the return value.
-}
welcomeGraphics : Element
welcomeGraphics =
    let dimensions = 90
        imgSize = 30
        elmLogo = image imgSize imgSize "http://elm-lang.org/logo.png"
        elmsPerSide = dimensions // imgSize
        row = flow right (map (always elmLogo) [1..elmsPerSide])
    in
        flow down (repeat elmsPerSide row)

-- main is where Elements go out to screen.
-- A flow lets you group Elements together such that they order in a certain way.
main : Element
main =
    flow down [
        helloWorld,
        welcomeGraphics,
        elmHeart
        ]

{- You can do more complex graphics in Elm with a collage of forms.
A collage is a list of forms that are placed within a bounded region.
A form is a shape or element that can then be graphically manipulated.
-}
elmHeart : Element
elmHeart =
    let root = sqrt 2 / 2
        scaleFactor = 100
        largeTrianglePoints = [(0,0), (root,0), (0,root)]
        largeTriangle = polygon largeTrianglePoints
        mediumTrianglePoints = [(0,0), (0.5,0), (0,0.5)]
        mediumTriangle = polygon mediumTrianglePoints
        smallTrianglePoints = [(0,0), (root/2,0), (0,root/2)]
        smallTriangle = polygon smallTrianglePoints
        elmSquare = square (root/2)
        parallelogramPoints = [(0,0), (0.5,0), (0.25,0.25), (-0.25,0.25)]
        parallelogram = polygon parallelogramPoints

        bigBlue = largeTriangle
            |> filled lightBlue
            |> scale scaleFactor
        bigGrey = largeTriangle
            |> filled (rgb 109 118 138)
            |> scale scaleFactor
        midBlue = mediumTriangle
            |> filled lightBlue
            |> scale scaleFactor
        smallOrange1 = smallTriangle
            |> filled orange
            |> scale scaleFactor
        smallOrange2 = smallTriangle
            |> filled orange
            |> scale scaleFactor
        greenSq = elmSquare
            |> filled green
            |> scale scaleFactor
        greenParallelogram = parallelogram
            |> filled green
            |> scale scaleFactor
    in
        collage 200 200 [                   -- we've made the tangram shapes
            greenSq                         -- now we can place them to make
                |> moveY -70                -- a picture. Try making your own
                |> rotate (pi / 4),         -- tangram picture!
            smallOrange1
                |> moveY -45
                |> rotate (3 * pi / 4),
            bigBlue
                |> move (25,-70)
                |> rotate (pi / 4),
            midBlue
                |> move (-25,-20)
                |> rotate pi,
            bigGrey
                |> move (-25, 30)
                |> rotate (-3 * pi / 4),
            greenParallelogram
                |> move (25,-20),
            smallOrange2
                |> move (24, 30)
                |> rotate (-3 * pi / 4)
        ]

