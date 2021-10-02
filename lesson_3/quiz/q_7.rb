number = 42

case number
when Integer    then p 'first'
when 10, 20, 30 then p 'second'
when 40..49     then p 'third'
end

