//
//  SchoolDetailsViewController.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/26/22.
//

import Foundation
import UIKit

class SchoolDetailsViewConroller : UIViewController{
    var schoolViewModel : SchoolViewModel?
    
    @IBOutlet var schoolName : UILabel!
    @IBOutlet var testTakers : UILabel!
    @IBOutlet var satCriticalReadingScore : UILabel!
    @IBOutlet var satMathReadingScore : UILabel!
    @IBOutlet var satWritingScore : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSATResultsViewContent()
    }
    
    /// Show the SAT resulst from Viewmodel
    func setSATResultsViewContent(){
        self.schoolName.text = self.schoolViewModel?.schoolName
        self.testTakers.text = self.schoolViewModel?.numOfSatTestTakers
        self.satCriticalReadingScore.text = self.schoolViewModel?.satCriticalReadingAvgScore
        self.satMathReadingScore.text = self.schoolViewModel?.satMathAvgScore
        self.satWritingScore.text = self.schoolViewModel?.satWritingAvgScore
        
    }
}
