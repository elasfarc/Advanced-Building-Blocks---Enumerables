def foo(*arg)
   pp "arg[0]-> memo is #{arg[0]}"
   pp "arg[1] is #{arg[1]}"
   pp !!arg[1]
end


#foo(12, 5)



def call_proc
   puts "Before proc"
   my_proc = Proc.new { return 2 }
   my_proc.call
   puts "After proc"
 end
x = 0
x =  call_proc

pp"//////////"
pp x