import Foundation

let a = 1.0
let b = 2.0
let c = -3.0
let discr = pow(b,2) - (4 * a * c)
let x1 = (-b + (sqrt(discr))) / (2 * a)
let x2 = (-b - (sqrt(discr))) / (2 * a)

let cat1 = 10.0
let cat2 = 12.0
let hyp = round(sqrt(pow(cat1,2) + pow(cat2,2)))
let p = cat1 + cat2 + hyp
let s = (cat1 * cat2)*(1/2)

let deposit = 12_000.0
let percent = 11.4
let time = 5
var profit = 0.0
for _ in 1...time {
    profit += deposit * (percent/100)
    print (profit + deposit)
}
