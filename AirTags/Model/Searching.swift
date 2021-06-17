//
//  Searching.swift
//  AirTags
//
//  Created by Michael Diaz on 4/21/21.
//

import Foundation


class Searching: ObservableObject {
        
        var itemTitle: String
        var distanceFromUser: Double
        var angle: Double
    
    
    init(itemTitle: String, distanceFromUser: Double, angle: Double) {
        
        self.itemTitle = itemTitle
        self.distanceFromUser = distanceFromUser
        self.angle = angle
    }
        
    
}

extension Searching {
    static var data: [Searching] {
        [
        Searching(itemTitle: "Michaels iPhone", distanceFromUser: 13.7, angle: 62)
        ]
    }
}
