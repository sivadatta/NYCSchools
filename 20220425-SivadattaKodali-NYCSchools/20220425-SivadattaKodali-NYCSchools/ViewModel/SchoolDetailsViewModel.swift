//
//  SchoolDetailsViewModel.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/27/22.
//

import Foundation

struct SchoolDetailsViewModel{
    var schoolViewModel : Observable<[SchoolViewModel]> = Observable([])
    
    /// The method to fetch the SAT scores 
    func fetchSATScores(){
        NetworkManager.fetchAPI(with: AppConstants.satScoresUrl, type: SATResults.self) {satResults, error in
            if let satScores = satResults {
                self.schoolViewModel.value = satScores.compactMap({
                    SchoolViewModel(dbn: $0.dbn ?? "1", schoolName: $0.school_name ?? "N/A", numOfSatTestTakers: $0.num_of_sat_test_takers ?? "N/A", satCriticalReadingAvgScore: $0.sat_critical_reading_avg_score ?? "N/A", satMathAvgScore: $0.sat_math_avg_score ?? "N/A", satWritingAvgScore: $0.sat_writing_avg_score ?? "N/A")
                })
            }else{
                self.schoolViewModel.value = nil
            }
        }
    }
    
    func satResultsAvailable(results:[SchoolViewModel]?, for school:String?) -> Int?{
        if let satResults = results, school != nil{
            return satResults.firstIndex(where: { $0.dbn == school}) ?? nil
        }
        return nil
    }
}


struct SchoolViewModel{
    let dbn : String
    let schoolName : String
    let numOfSatTestTakers : String
    let satCriticalReadingAvgScore : String
    let satMathAvgScore : String
    let satWritingAvgScore : String
}
