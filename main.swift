import UIKit

var str = "Hello, playground"

//Input: list of names
//Output: list of lists that each list is 3-5 elements
//Random distribution

//Find the number of groups
//In loop for X number of times
//randomly generate a number
//remove this element from the list
//add the element to one of the groups
//rotate to the next group
//0 , 1 ,2, 3, 4, 5 -> One group
//6,7
func splitIntoGroups(_ empList2: [String]) -> [[String]] {
    if empList2.count < 6 {
        return [empList2]
    }
    let numberOfGroups = getNumberOfGroups(empList2.count, minSize: 3, maxSize: 5) //figure out if we need better algorithm
    var empList = empList2
    var groups = getListOfGroups(numberOfGroups)
    var currentGroupToAssign = 0
    let totalEmp = empList.count
    for _ in 0...totalEmp-1 {
        let empToRemove = getRandomNumber(0, max: empList.count-1)
        let emp = empList.remove(at: empToRemove)
      //  print(emp)
      //  print("group to assign \(currentGroupToAssign)")
        currentGroupToAssign = currentGroupToAssign % numberOfGroups //(0,1) 0%2=0, 1%2=1 2
        groups[currentGroupToAssign].append(emp)
        currentGroupToAssign += 1
    
    }
    return groups
}

func getListOfGroups(_ numberOfGroups: Int) -> [[String]] {
    var groups = [[String]]()
    for _ in 0 ... numberOfGroups-1 {
        groups.append([])
    }
    //print(groups)
    return groups
}

func getRandomNumber(_ min:Int, max:Int) -> Int {
    let randomNumber = Int.random(in: min ... max)
   // print(randomNumber)
    return randomNumber
}
func getNumberOfGroups(_ num: Int, minSize: Int, maxSize: Int) -> Int { //8 min 3 2 (2)
    let numOfGroups = num/minSize
    //print("number of groups \(numOfGroups)")
    return numOfGroups
}

var names = ["a","b","c","d","e","f","g","h","i","j","K","l","m","n","o","p"]
var groups = splitIntoGroups(names)
print(groups)
groups = splitIntoGroups(names)
print(groups)
