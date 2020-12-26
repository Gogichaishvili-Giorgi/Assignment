import UIKit

import UIKit




//1) დაწერეთ ფუნქცია რომელსაც გადაემეცემა ტექსტი  და აბრუნებს პალინდრომია თუ არა. (პალინდრომი არის ტექსტი რომელიც ერთნაირად იკითხება ორივე მხრიდან)
//Boolean isPalindrome(String text);

func isPalindrome(text:String) ->Bool {
    let reversed = String(text.reversed())
    return text == reversed
}

isPalindrome(text: "ABCBA")

//: [Next](@next)


//2)გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.

let coins:[Int] = [50,20,10,5,1]

func minSplit(amount:Int)-> Int {
    var numberOfCoins = 0
    
    guard amount > 0 else {
        return numberOfCoins
    }
    
    var reminder = amount
    
    for coinValue in coins {
        if reminder >= coinValue {
            numberOfCoins += reminder / coinValue
            reminder -= (reminder / coinValue) * coinValue
        }
        if reminder <= 0 {
            break
        }
    }
    
    return numberOfCoins
}


minSplit(amount: 10032)


//3)მოცემულია მასივი, რომელიც შედგება მთელი რიცხვებისგან. დაწერეთ ფუნქცია რომელსაც გადაეცემა ეს მასივი და აბრუნებს მინიმალურ მთელ რიცხვს, რომელიც 0-ზე მეტია და ამ მასივში არ შედის.
//
//Int notContains(Int[] array);

func notContains(array:[Int]) -> Int {
    var smallest = 1
    
    if array.count == 0 {
        return smallest
    }
    
    let uniqueArray = Array(Set(array))
    let positiveSortedArray = uniqueArray.filter { $0 > 0 }.sorted()
    
    for i in positiveSortedArray {
        if smallest < i {
            return smallest
        }
        smallest = i + 1
    }
    
    return smallest
}


notContains(array: [1, 2, 8, 12, 0, 4, -1, 2])

//4)მოცემულია String რომელიც შედგება „(„ და „)“ ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
//
//Boolean isProperly(String sequence);
//
//მაგ: (()()) სწორი მიმდევრობაა,  ())() არასწორია
func isProperly(sequence: String) -> Bool {
    var charStack = [Character]()
    
    for char in sequence {
        if "(" == char {
            charStack.append(char)
        } else if ")" == char {
            if !charStack.isEmpty, let last = charStack.last, last == "(" {
                charStack.popLast()
            } else {
                return false
            }
        }
    }
    
    return charStack.isEmpty
}


isProperly(sequence: "(a+1)+(b+2)-(d*1)")
