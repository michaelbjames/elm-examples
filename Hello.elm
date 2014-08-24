-- Welcome to your first Elm program!

-- Let's go through some basic syntax to get you up to speed

{- Set values or functions in name
All values have a static, immutable type.
-}
myFavoriteTypeface : String
myFavoriteTypeface = "Gotham"

-- Lists are between [] and comma separated. It's what you expect.
typefaces : [String]
typefaces = [
    myFavoriteTypeface,
    "Century Gothic",
    "sans-serif"
    ]

{- Elements are graphical objects. On the highest level, these are
what you manipulate and show on screen.
-}
helloWorld : Element
helloWorld = "Hello, World!"
    |> toText                 -- toText : String -> Text
    |> typeface typefaces     -- typeface : Text -> Text
    |> rightAligned           -- rightAligned : Text -> Element

main : Element
main = helloWorld
