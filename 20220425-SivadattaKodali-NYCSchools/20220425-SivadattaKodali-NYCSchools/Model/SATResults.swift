//
//  SATResults.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/25/22.
//

import Foundation

/// Model to hold the SAT Results
struct SATResults : Codable{
    
    let dbn : String?
    let school_name : String?
    let num_of_sat_test_takers : String?
    let sat_critical_reading_avg_score : String?
    let sat_math_avg_score : String?
    let sat_writing_avg_score : String?
}
