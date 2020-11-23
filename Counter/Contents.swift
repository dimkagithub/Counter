import Foundation

enum Month: CaseIterable {
    case Январь
    case Февраль
    case Март
    case Апрель
    case Май
    case Июнь
    case Июль
    case Август
    case Сентябрь
    case Октябрь
    case Ноябрь
    case Декабрь
}
func counter(_ array: [Int]) -> (min: Int, max: Int, average: Int) {
    let min = array.min()
    let max = array.max()
    var average = 0
    for index in array {
        average += index
    }
    average = average / array.endIndex
    return (min!, max!, average)
}
var array = [Int]()
for _ in array.count...11 {
    let indications = Int.random(in: 1000...50000)
    array.append(indications)
}
let sortedArray = array.sorted()
func getCurrentDate(){
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_Ru")
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    formatter.dateStyle = .short
    let currentDate = formatter.string(from: date)
    print("""
        Текущая дата: \(currentDate)
        Текущее время: \(hour):\(minute)

        """)
}
getCurrentDate()
let indications = counter(array)
let month = Month.self
var index = 0
print("Показания счеткика, кВт: \(sortedArray.max()!)")
for month in Month.allCases {
    print("\(month): \(sortedArray[index])")
    index += 1
}

print("Среднее показание за 12 месяцев, кВт: \(indications.average)")
