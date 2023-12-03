lines = open("../inputs/day2/inputs1.txt") do file
    l = readlines(file)
    return l
end

function parse_game(game)
    cubes = split(game, ", ")
    counts = Dict("red"=>0, "green"=>0, "blue"=>0)
    for cube in cubes
        number, color = split(cube, " ")
        counts[color] = parse(Int,number)
    end
    return counts
end

function parse_line(line)
    game, games = split(line, ": ")
    game_id = parse(Int,split(game, " ")[end])
    games = split(games, "; ")
    games = [parse_game(game) for game in games]

    game_id, games
end

function power(game)
    reds = maximum([round["red"] for round in game])
    blues = maximum([round["blue"] for round in game])
    greens = maximum([round["green"] for round in game])
    reds*blues*greens
end

function solve(lines)
    powers = 0
    for line in lines
        game_id, games = parse_line(line)
        powers += power(games)
    end
    powers
end

solve(lines)
