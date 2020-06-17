//
//  Combat.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-06.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation

protocol TransformerMethods {
    
    // MARK: Methods
    // Ranking
    mutating func overallRanking(
        strength: Float,
        intelligence: Float,
        speed: Float,
        endurance: Float,
        firepower: Float) -> Float
    
    // MARK: Methods for Combat
    // sorting tranformers based on rank nto category
    mutating func sort(transformer: [Transformer]) -> (autobots: [Transformer?], decpticons: [Transformer?])
    
    // fight method
    mutating func fight(autobot: Transformer, decpticon: Transformer) -> Transformer?
    
}



extension TransformerMethods {
    
    // implementing overall Ranking method
    mutating func overallRanking(
        strength: Float,
        intelligence: Float,
        speed: Float,
        endurance: Float,
        firepower: Float) -> Float {
        return strength + intelligence + speed + endurance + firepower
    }
    
    mutating func sort(transformers: [Transformer]) -> (autobots: [Transformer?], decpticons: [Transformer?]) {
        // create a array to hold autobots [] to hold names and rank
        var autobots = transformers
        // create another darray to hold decpticons [] to hold name and rank
        var decepticons = transformers
        // interate through the array
        for transformer in transformers {
            if transformer.type == "A" {
                autobots.append(transformer)
            } else {
                decepticons.append(transformer)
            }
        }
        // use insertion sort to insert in desending order
        return ([], [])
    }
    
    mutating func fight(autobot: [Transformer], decpticon: [Transformer]) -> Transformer? {
        var winningTransformer: Transformer? = nil
        // use the return value form the sort function as input here
        
        // first check for the names of the value in the first index
        // if it's the special case take appropriate action
        // compare rank value first value from each input array and
        // assign the first value with the highest rank value to winningTransformer
        // then delete the first value with the smallest ran value
        // finnally return the winningTransformer if there is one.
        
        return winningTransformer
    }
}
