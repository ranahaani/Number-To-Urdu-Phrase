//
//  main.swift
//  Number To Urdu Phrase
//
//  Created by Muhammad Abdullah on 21/06/2019.
//  Copyright © 2019 Muhammad Abdullah. All rights reserved.
//
import Foundation

extension Int {
    /// returns number of digits in Int number
    public var digitCount: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
    /// returns number of useful digits in Int number
    public var usefulDigitCount: Int {
        get {
            var count = 0
            for digitOrder in 0..<self.digitCount {
                /// get each order digit from self
                let digit = self % (Int(truncating: pow(10, digitOrder + 1) as NSDecimalNumber))
                    / Int(truncating: pow(10, digitOrder) as NSDecimalNumber)
                if isUseful(digit) { count += 1 }
            }
            return count
        }
    }
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if number < 10 && number >= 0 || number > -10 && number < 0 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
    // returns true if digit is useful in respect to self
    private func isUseful(_ digit: Int) -> Bool {
        return (digit != 0) && (self % digit == 0)
    }
}


func convertNumberToPharase(input: String)->Void  {
    
    let inputNumber = Int(input)
    if let number = inputNumber{
        let digits = number.digitCount
        if digits >= 1 && digits <= 7 {
            if digits == 1 || digits == 2 {
                print(RomanGinti(rawValue: number)!)
            }
            else if digits == 3{
                var num = number
                let firstDigit = num / 100
                num = num % 100
                print("\(RomanGinti(rawValue: firstDigit)!) Sow \(RomanGinti(rawValue: num)!)")
                
            }
            else if digits == 4 || digits == 5{
                var num = number
                let firstDigit = num / 1000
                num = num % 1000
                let secondDigit = num / 100
                num = num % 100
                print("\(RomanGinti(rawValue: firstDigit)!) Hazzar \(RomanGinti(rawValue: secondDigit)!) Sow \(RomanGinti(rawValue: num)!)")
                
            }
            else if digits == 6 || digits == 7 {
                var num = number
                let firstDigit = num / 100000
                num = num % 100000
                let secondDigit = num / 1000
                num = num % 1000
                let thirdDigit = num / 100
                num = num % 100
                print("\(RomanGinti(rawValue: firstDigit)!) Lakh \(RomanGinti(rawValue: secondDigit)!) Hazar \(RomanGinti(rawValue: thirdDigit)!) Sow \(RomanGinti(rawValue: num)!)")
            }
        }
        else{
            print("Number should be between 0 to 9999999")
        }
    }
    else{
        print("Not a valid number")
    }
}

func main(){
    print("Please input a number", "\nTo Exit Enter Q")
    while true {
        let input = readLine(strippingNewline: true)
        if input == "q" || input == "Q"{
            break
        }
        else{
            convertNumberToPharase(input: input!)
        }
    }
}

main()

