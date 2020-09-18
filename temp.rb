def foo(*arg)
   pp "arg[0]-> memo is #{arg[0]}"
   pp "arg[1] is #{arg[1]}"
   pp !!arg[1]
end


foo(12, 5)