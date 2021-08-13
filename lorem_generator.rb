def dices (til=0)
    return rand(0...til)
end

loremipsumificatorum_seed = "Lorem ipsum dolor sit amet consectetur adipiscing elit Phasellus fermentum orci nec tortor sollicitudin viverra Pellentesque id nibh ut erat pretium pulvinar eget eu eros Integer rutrum diam at metus viverra dapibus Nullam eu leo tincidunt finibus nulla id tempor risus Morbi porta ante vitae tempus sollicitudin quam orci suscipit nulla a posuere leo erat ut tellus Phasellus lacinia ut purus ut accumsan Fusce quam sem convallis at elementum nec auctor vel quam Donec lacinia varius porta Aenean eu nisi non sapien facilisis pellentesque et quis leo Pellentesque porta ligula eget lectus porta tincidunt Ut sit amet tortor convallis viverra est a fermentum ligula Donec rutrum elementum odio tincidunt porta In dapibus augue nibh ac efficitur tortor euismod ac Donec ut tempor diam"

vocals = "aeiou"
consonants = "bcdfghlmnpqrstvwxyz"

c_factor = []
for c in 0...consonants.length
    c_sum = 0
    for j in 0...loremipsumificatorum_seed.length
        if loremipsumificatorum_seed[j] == consonants[c]
            c_sum += 1
        end
    end

    c_factor.append(c_sum)
end

v_factor = []
for v in 0...vocals.length
    v_sum = 0
    for j in 0...loremipsumificatorum_seed.length
        if loremipsumificatorum_seed[j] == vocals[v]
            v_sum += 1
        end
    end

    v_factor.append(v_sum)
end

new_chain = ""
for c in 0...consonants.length
    if consonants[c] * c_factor[c] != ""
        new_chain += consonants[c] * c_factor[c]
    end
end

n_user = 0
while true
    print "> Parrafos a generar (0 para salir): "
    n_user = gets.chomp

    if n_user == n_user.to_i.to_s && n_user.to_i > 0
        n_user.to_i.times {
            dictionary = loremipsumificatorum_seed.split
            consonants = new_chain
        
            for word in 0...dictionary.length
        
                (dictionary.length).times {
                    this_word = dices(dictionary.length)
                    this_other_word = dices(dictionary.length)
        
                    this_one = dictionary[this_word]
                    dictionary[this_word] = dictionary[this_other_word]
                    dictionary[this_other_word] = this_one
                }
                
                temporal_word = dictionary[word]
                rand(1..temporal_word.length * 5).times {
                    magic_conch_shell = dices(temporal_word.length)
        
                    if vocals.include? temporal_word[magic_conch_shell]
                        temporal_word.sub! temporal_word[magic_conch_shell], vocals[dices(vocals.length)]
                    elsif consonants.include? temporal_word[magic_conch_shell]
                        temporal_word.sub! temporal_word[magic_conch_shell], consonants[dices(consonants.length)]
                    end
                }
                
            end
        
            puts dictionary.join(" ").capitalize() + ".\n\n"
        }

    elsif n_user == n_user.to_i.to_s && n_user.to_i == 0
        puts "> Goodbye."
        break

    else
        puts "[!] Incorrecto."

    end
end


