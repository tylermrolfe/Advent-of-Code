for (index, _) in input.enumerated() {
    // Set to hold the characters
    var temp: Set<Character> = []
    if index + 3 < input.count {
        temp.insert(input[index])
        temp.insert(input[index + 1])
        temp.insert(input[index + 2])
        temp.insert(input[index + 3])
    }
    
    // Checks to see if there is a set with 4 unique chars and if so, print the location of the last char
    if temp.count == 4 {
        print(index + 4)
        break
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
