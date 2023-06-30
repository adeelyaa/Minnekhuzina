import UIKit


protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct Homework: HomeworkService {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let quotient = x / y
        let remainder = x % y
        return (quotient, remainder)
    }

    func fibonacci(n: Int) -> [Int] {
        assert(n > 1)
        var array = [0, 1]
        while array.count < n {
            array.append(array[array.count - 1] + array[array.count - 2])
        }
        return array
    }
    
    func sort(rawArray: [Int]) -> [Int] {
            var arr = rawArray
            for _ in 0...arr.count {
                for i in 1...arr.count - 1 {
                    if arr[i-1] > arr[i] {
                        let largerValue = arr[i-1]
                        arr[i-1] = arr[i]
                        arr[i] = largerValue
                    }
                }
            }
            return arr
        }
    
    func firstLetter(strings: [String]) -> [Character] {
        var firstLetters: [Character] = []
        for string in strings {
            if let firstLetter = string.first {
                firstLetters.append(firstLetter)
            }
        }
        return firstLetters
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var filteredArray: [Int] = []
        for element in array {
            if condition(element) {
                filteredArray.append(element)
            }
        }
        return filteredArray
    }

}

/*
 Реализовать ООП модель Национальной библиотеки Республики Татарстан.

 Требования:

 Минимум 5 классов, 3 структуры, 2 протокола, 2 enum.
 Из части классов должна выстраиваться иерархия наследования с переопределением методов.
 Необходимо использовать разные модификаторы доступа.
 */

class Person {
    var name: String
    
    init(name: String) {
        self.name = name;
    }
    
    func price() {
        print(500)
    }
}

class Student: Person {
    var discount = true
    
    override func price() {
        print(500 * 0,5)
    }
}

class libraryItem {
    var title: String
    var year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
    
    func floor() {
    
    }
}

class book: libraryItem {
    var author: String
    
    init(title: String, year: Int, author: String) {
        self.author = author
        super.init(title: title, year: year)
    }
    
    override func floor() {
        print("second")
    }
}

class magazine: libraryItem {
    var pictures = true
    
    override func floor() {
        print("third")
    }
}

struct genre {
    let thriller: String
    let scienceFiction: String
    let horror: String
}

struct author {
    var name: String
    var age: Int
    
    func printAuthor() {
        print("name = \(name); age = \(age)")
    }
}

struct coffee {
    var latte: String
    var cappuccino: String
}

protocol reserve {
    var isReserved: Bool { get set }
}

protocol search {
    func search(by criteria: String)
}


enum floor {
    case first
    case second
}

enum bookCover {
    case hard
    case soft
}









