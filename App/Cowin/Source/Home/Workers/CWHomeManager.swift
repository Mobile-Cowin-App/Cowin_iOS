//
//  CWHomeManager.swift
//  Cowin
//


import Foundation
import HelperKit
import CWNetworkSDK

protocol ICWHomeManager: AnyObject {
	// do someting...
    func generateDataSource(with model: CWStatsModel) -> [CWHomePageDataSource]
}

class CWHomeManager: ICWHomeManager {
	// do someting...
    
    func generateDataSource(with model: CWStatsModel) -> [CWHomePageDataSource] {
        var dataSource = [CWHomePageDataSource]()
        
        dataSource.append(CWHomePageDataSource.TodayStatsModel(model))
        
        let vaccinatedStatus = CWVaccinatedStatus(vaccinated: true, vaccinatedTime: Date().convert("EEEE, MMM d, yyyy"))
        dataSource.append(CWHomePageDataSource.VaccinatedStatus(vaccinatedStatus))
        
        dataSource.append(CWHomePageDataSource.Banner(["https://www.freepik.com/free-vector/hand-drawn-covid-19-vaccine-banner-template_13831289.htm#page=1&query=vaccine&position=4"]))
        
        return dataSource
    }
}

enum CWHomePageDataSource {

    case TodayStatsModel(CWHomeTodayVaccinationStats)
    case VaccinatedStatus(CWVaccinatedStatus)
    case Banner([String])
}


struct CWVaccinatedStatus {
    
    var vaccinated: Bool = .defaultValue
    var vaccinatedTime: String = .defaultValue
}

protocol CWHomeTodayVaccinationStats {
    
    var total: Double? { get }
    var male: Double? { get }
    var female: Double? { get }
    var others: Double? { get }
}

extension CWStatsModel: CWHomeTodayVaccinationStats {
    
    var total: Double? { self.topBlock.vaccination.today }
    var male: Double? { self.topBlock.vaccination.today_male }
    var female: Double? { self.topBlock.vaccination.today_female }
    var others: Double? { self.topBlock.vaccination.today_others }
}
