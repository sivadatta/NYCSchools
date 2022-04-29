//
//  School.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/25/22.
//

import Foundation

/// Model to hold the school information
struct School : Codable {
    let dbn : String?
    let school_name : String?
    let boro : String?
    let overview_paragraph : String?
    let school_10th_seats : String?
    let academicopportunities1 : String?
    let academicopportunities2 : String?
    let ell_programs : String?
    let neighborhood : String?
    let building_code : String?
    let location : String?
    let phone_number: String?
    let fax_number : String?
    let school_email : String?
    let website : String?
    let subway : String?
    let bus : String?
    let grades2018 : String?
    let finalgrades : String?
    let total_students : String?
    let extracurricular_activities : String?
    let school_sports : String?
    let attendance_rate : String?
    let pct_stu_enough_variety : String?
    let pct_stu_safe : String?
    let school_accessibility_description : String?
    let directions1 : String?
    let requirement1_1 : String?
    let requirement2_1 : String?
    let requirement3_1 : String?
    let requirement4_1 : String?
    let requirement5_1 : String?
    let offer_rate1 : String?
    let program1 : String?
    let code1 : String?
    let interest1 : String?
    let method1 : String?
    let seats9ge1 : String?
    let grade9gefilledflag1 : String?
    let grade9geapplicants1 : String?
    let seats9swd1 : String?
    let grade9swdfilledflag1 : String?
    let grade9swdapplicants1 : String?
    let seats101 : String?
    let admissionspriority11 : String?
    let admissionspriority21 : String?
    let admissionspriority31 : String?
    let grade9geapplicantsperseat1 : String?
    let grade9swdapplicantsperseat1 : String?
    let primary_address_line_1 : String?
    let city : String?
    let zip : String?
    let state_code : String?
    let latitude : String?
    let longitude : String?
    let community_board : String?
    let council_district : String?
    let census_tract: String?
    let bin : String?
    let bbl : String?
    let nta : String?
    let borough : String?    
}
