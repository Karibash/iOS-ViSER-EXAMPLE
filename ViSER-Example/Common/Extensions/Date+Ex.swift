//
//  Date+Ex.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/04.
//

import Foundation

extension Date {

    func elapsedYears(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }

    func elapsedMonths(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }

    func elapsedWeeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }

    func elapsedDays(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }

    func elapsedHours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

    func elapsedMinutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }

    func elapsedSeconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }

    func elapsed(from date: Date) -> String {
        if elapsedYears(from: date)   > 0 { return "\(elapsedYears(from: date))年前"   }
        if elapsedMonths(from: date)  > 0 { return "\(elapsedMonths(from: date))月前"  }
        if elapsedWeeks(from: date)   > 0 { return "\(elapsedWeeks(from: date))週前"   }
        if elapsedDays(from: date)    > 0 { return "\(elapsedDays(from: date))日前"    }
        if elapsedHours(from: date)   > 0 { return "\(elapsedHours(from: date))時間前"   }
        if elapsedMinutes(from: date) > 0 { return "\(elapsedMinutes(from: date))分前" }
        if elapsedSeconds(from: date) > 0 { return "\(elapsedSeconds(from: date))秒前" }
        return "不明"
    }

}
