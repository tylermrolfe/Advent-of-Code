class Instruction {
    let numberToMove: Int
    let origin: Int
    let destination: Int
    
    init(numberToMove: Int, origin: Int, destination: Int) {
        self.numberToMove = numberToMove
        // Sets the value to the proper index value
        self.origin = origin - 1
        self.destination = destination - 1
    }
}

// Initial Stacks
var one = ["F", "D", "B", "Z", "T", "J", "R", "N"]
var two = ["R", "S", "N", "J", "H"]
var three = ["C", "R", "N", "J", "G", "Z", "F", "Q"]
var four = ["F", "V", "N", "G", "R", "T", "Q"]
var five = ["L", "T", "Q", "F"]
var six = ["Q", "C", "W", "Z", "B", "R", "G", "N"]
var seven = ["F", "C", "L", "S", "N", "H", "M"]
var eight = ["D", "N", "Q", "M", "T", "J"]
var nine = ["P", "G", "S"]

// Multi-dimensional arrays
var stacks = [one, two, three, four, five, six, seven, eight, nine]

func partOne() {
    var instructions: [Instruction] = []
    
    //Remove instruction commands from input
    var chars = input.components(separatedBy: CharacterSet.decimalDigits.inverted)
    var ints: [Int] = []
    //Create array with nothing but ints
    for char in chars {
        if !char.isEmpty {
            ints.append(Int(char)!)
        }
    }
    //Convert int array into Instruction objects
    while !ints.isEmpty {
        let instruction = Instruction(numberToMove: ints[0], origin: ints[1], destination: ints[2])
        instructions.append(instruction)
        ints.removeSubrange(0...2)
    }
    
    for instruction in instructions {
        var i = 1
        var tempStack: [String] = []
        while i <= instruction.numberToMove {

            tempStack.append(stacks[instruction.origin].popLast()!)
            i += 1
        }
        var j = 1
        while j <= tempStack.count {
            stacks[instruction.destination].append(tempStack.popLast()!)
        }
    }
    var output = ""
    for stack in stacks {
        output += stack.last ?? ""
    }
    
    print(output)
}

func partTwo() {
    var instructions: [Instruction] = []
    
    //Remove instruction commands from input
    var chars = input.components(separatedBy: CharacterSet.decimalDigits.inverted)
    var ints: [Int] = []
    //Create array with nothing but ints
    for char in chars {
        if !char.isEmpty {
            ints.append(Int(char)!)
        }
    }
    //Convert int array into Instruction objects
    while !ints.isEmpty {
        let instruction = Instruction(numberToMove: ints[0], origin: ints[1], destination: ints[2])
        instructions.append(instruction)
        ints.removeSubrange(0...2)
    }
    
    for instruction in instructions {
        var i = 1
        while i <= instruction.numberToMove {
            stacks[instruction.destination].append(stacks[instruction.origin].popLast()!)
            i += 1
        }
    }
    var output = ""
    for stack in stacks {
        output += stack.last ?? ""
    }
    print(output)
}


