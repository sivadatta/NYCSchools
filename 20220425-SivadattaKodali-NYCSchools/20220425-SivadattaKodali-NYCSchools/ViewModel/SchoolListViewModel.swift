//
//  SchoolListViewModel.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/26/22.
//

import Foundation

struct SchoolListViewModel{
    var schoolsTableViewCellViewModel : Observable<[SchoolTableViewCellViewModel]> = Observable([])
    
    /// The method to fetch the schools information
    func fetchSchools(){
        NetworkManager.fetchAPI(with: AppConstants.schoolListUrl, type: School.self) { schools, errors in
            if let schoolsList = schools {
                self.schoolsTableViewCellViewModel.value = schoolsList.compactMap({
                    SchoolTableViewCellViewModel(schoolName: $0.school_name ?? "N/A", dbn: $0.dbn ?? "1")
                })
            }else{
                self.schoolsTableViewCellViewModel.value = nil
            }
        }
    }
}

struct SchoolTableViewCellViewModel{
    let schoolName : String
    let dbn : String
}
