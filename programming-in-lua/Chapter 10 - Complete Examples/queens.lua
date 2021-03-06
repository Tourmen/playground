--[[
    Modify the eight-queen program so that it stops after printing the first
solution.
]]

local function printSolution(board)
    board.solutionNumber = board.solutionNumber + 1
    io.write("Solution " .. board.solutionNumber .. "\n")
    for i = 1, board.size do
        for j = 1, board.size do
            io.write(j == board[i] and "X " or "- ")
        end
        io.write("\n")
    end
    io.write("\n")
end

local function checkPosition(row, col, board)
    for i = 1, row - 1 do
        if col == board[i] then return false end
        if row - col == i - board[i] then return false end
        if row + col == i + board[i] then return false end
    end
    return true
end

function placeQueen(row, board)
    if row > board.size then
        printSolution(board)
    else
        for col = 1, board.size do
            if checkPosition(row, col, board) then
                board[row] = col
                placeQueen(row + 1, board)
            end
        end
    end
end

placeQueen(1, { ["solutionNumber"] = 0, ["size"] = 8 })

-- disable solution print for real result
print(os.clock())
