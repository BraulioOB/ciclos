password = ARGV[0]
base = "a"

contador = 0
while base != password do
  base = base.next
  contador = contador + 1
end

puts contador