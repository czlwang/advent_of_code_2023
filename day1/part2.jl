lines = open("../inputs/day1/inputs1.txt") do file
    l = readlines(file)
    return l
end

names = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

function disambiguate(line)
    digits = []
    while length(line) > 0
        for (digit, name) in enumerate(names) 
            if length(line) >= length(name) && startswith(line, name)
                push!(digits, digit)
            end
        end

        if isdigit(line[1])
            push!(digits, parse(Int, line[1]))
        end
        line = line[2:end]
    end
    10*digits[1] + digits[end]
end

print(sum([disambiguate(l) for l in lines]))
