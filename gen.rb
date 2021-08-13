def gen (num)
    chain = "abcdefghijklmnñopqrstuvwxyz"

    if not (num > chain.length)
        return chain[0..num]
    else
        return chain
    end
end

begin
    user =  Integer(ARGV[0])
    puts gen(user)

rescue 
    puts "------> DEBE INGRESAR SOLO NUMEROS <-------"
end