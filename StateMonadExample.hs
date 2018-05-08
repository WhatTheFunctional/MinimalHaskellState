--StateMonadExample.hs
--Copyright Laurence Emms 2018

--A minimal example of the State monad

import Control.Monad.State

--Make a stateful increment function
increment :: State Int Int
increment = state (\i -> (i, i + 1))

--Use the stateful increment function in another recursive function
threeIncrementer :: State Int Int
threeIncrementer = increment >> --Increment 3 times
                   increment >>
                   increment >>=
                   (\i -> if i >= 10 
                          then get --Evaluate to the current state function if i >= 10
                          else threeIncrementer) --Call incrementer recursively if i < 10

main = putStrLn $ show $ execState threeIncrementer 0 --Run the threeIncrementer with initial state 0
