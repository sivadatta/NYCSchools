//
//  Constants.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/28/22.
//

import Foundation

/// Created  constants in AppConstants enum
enum AppConstants{
    static let schoolListUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    static let satScoresUrl   = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    static let schoolCellIdentifier = "schoolCell"
    static let schoolDetailsSegueIdentifier = "schoolDetailsIdentifier"
    static let errorTitle = "Error!"
    static let schoolListErrorMsg  = "There is an error while fetching the schools List or schools list is empty."
    static let schoolDetailsErrorMsg  = "There is an error while fetching the SAT results or the school that you are looking is not available."

}
