<<<<<<< HEAD
module Shuffler where

import Common
import System.Random
import System.Random.Shuffle

-- TODO: Implement a random shuffling algorithm
shuffleDeck :: State -> IO State
shuffleDeck st = do 
	let shufdeck = shuffler seed
	updateDeck' st $ drop 29 shufdeck

shuffler :: (RandomGen gen) => gen -> [Card]
shuffler = shuffle' fullDeck 108

seed = mkStdGen 1234

-- 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
-- x 1 2 3 x 5 6 7 x 9 10 11  x 13 14 15  x 17 18 19  x 21 22 23  x 25 26 27
--   x 2 3   x 6 7   x 10 11     x 14 15     x 18 19     x 22 23     x 26 27
--     x 3     x 7      x 11        x 15        x 19        x 23        x 27
--       x       x         x           x          x            x           x

-- where x = dealt card to each player simultaenously

updateDeck' :: State -> Deck -> IO State
updateDeck' gs deck' = return (gs { deck = deck' })
=======
module Shuffler where

import Common
import System.Random
import System.Random.Shuffle

-- TODO: Implement a random shuffling algorithm
shuffleDeck :: State -> IO State
shuffleDeck state@State{players = _players, 
                        deck = _deck} = return state { players = setHnds (shufdeck) 0 4 _players,
                                                        deck = drop 28 shufdeck}
                                            where shufdeck = shuffler seed                                


shuffler :: (RandomGen gen) => gen -> [Card]
shuffler = shuffle' fullDeck 108

seed = mkStdGen 1234

setHnds :: Deck -> Int -> Int -> [Player] -> [Player]
setHnds deck m n [] = []
setHnds deck m n (p:ps) = p {hand = setCards deck m n} : setHnds deck (m+1) (n+1) ps

setCards :: Deck -> Int -> Int -> Hand
setCards deck m n = map (deck!!) ids where ids = takeWhile (<28) [m,n..]

-- CARD DISTRIBUTION EACH PLAYER

-- REFER TO ALJOMAI'S ILLUSTRATION

-- 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
-- x 1 2 3 x 5 6 7 x 9 10 11  x 13 14 15  x 17 18 19  x 21 22 23  x 25 26 27
--   x 2 3   x 6 7   x 10 11     x 14 15     x 18 19     x 22 23     x 26 27
--     x 3     x 7      x 11        x 15        x 19        x 23        x 27
--       x       x         x           x          x            x           x

-- where x = dealt card to each player simultaenously
>>>>>>> origin/master
