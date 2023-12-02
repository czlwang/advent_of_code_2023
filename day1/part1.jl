lines = open("../inputs/day1/inputs1.txt") do file
    l = readlines(file)
    return l
end

digits = [filter(isdigit, collect(l)) for l in lines]
values = [d[[1,end]] for d in digits]
values = [parse(Int, join(v)) for v in values]
print(sum(values))
