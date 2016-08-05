//
//  CustomModelContainer+JSON.swift
//  Arrow
//
//  Created by Sacha Durand Saint Omer on 10/07/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Arrow

extension CustomModelContainer:ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        stats <-- json["stats"]
        optionalStats = nil
        optionalStats <-- json["stats"]
    }
}
