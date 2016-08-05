//
//  EnumContainer.swift
//  Arrow
//
//  Created by Sacha Durand Saint Omer on 10/07/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

struct EnumContainer {
    var weekday: WeekDay = .monday
    var difficulty = Difficulty.Low
    var optionalWeekday: WeekDay?
    var optionalDifficulty: Difficulty?
}
