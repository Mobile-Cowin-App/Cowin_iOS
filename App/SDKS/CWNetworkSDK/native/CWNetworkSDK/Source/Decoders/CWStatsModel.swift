//
//  CWStatsModel.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

// MARK: - CWStatsModel
public struct CWStatsModel: Codable {
    public let topBlock: TopBlock
    public let vaccinationDoneByTime: [VaccinationDoneByTime]
    public let last7DaysRegistration: [Last7DaysRegistration]
    public let last30DaysAefi: [Last30DaysAefi]
    public let last5DaySessionStatus: [Last5DaySessionStatus]
    public let getBeneficiariesGroupBy: [GetBeneficiariesGroupBy]
    public let aefiPercentage: Double
    public let vaccinationByAge: VaccinationByAge
    public let timeWiseTodayRegReport: [TimeWiseTodayRegReport]
    public let vaccinationDoneByTimeAgeWise: [VaccinationDoneByTimeAgeWise]
    public let timestamp: String

    enum CodingKeys: String, CodingKey {
        case topBlock, vaccinationDoneByTime, last7DaysRegistration, last30DaysAefi
        case last5DaySessionStatus = "last5daySessionStatus"
        case getBeneficiariesGroupBy, aefiPercentage, vaccinationByAge, timeWiseTodayRegReport, vaccinationDoneByTimeAgeWise, timestamp
    }

    public init(topBlock: TopBlock, vaccinationDoneByTime: [VaccinationDoneByTime], last7DaysRegistration: [Last7DaysRegistration], last30DaysAefi: [Last30DaysAefi], last5DaySessionStatus: [Last5DaySessionStatus], getBeneficiariesGroupBy: [GetBeneficiariesGroupBy], aefiPercentage: Double, vaccinationByAge: VaccinationByAge, timeWiseTodayRegReport: [TimeWiseTodayRegReport], vaccinationDoneByTimeAgeWise: [VaccinationDoneByTimeAgeWise], timestamp: String) {
        self.topBlock = topBlock
        self.vaccinationDoneByTime = vaccinationDoneByTime
        self.last7DaysRegistration = last7DaysRegistration
        self.last30DaysAefi = last30DaysAefi
        self.last5DaySessionStatus = last5DaySessionStatus
        self.getBeneficiariesGroupBy = getBeneficiariesGroupBy
        self.aefiPercentage = aefiPercentage
        self.vaccinationByAge = vaccinationByAge
        self.timeWiseTodayRegReport = timeWiseTodayRegReport
        self.vaccinationDoneByTimeAgeWise = vaccinationDoneByTimeAgeWise
        self.timestamp = timestamp
    }
}

// MARK: - GetBeneficiariesGroupBy
public struct GetBeneficiariesGroupBy: Codable {
    public let stateID, id: Int
    public let title, stateName: String
    public let total, partialVaccinated, totallyVaccinated, today: Int

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case id, title
        case stateName = "state_name"
        case total
        case partialVaccinated = "partial_vaccinated"
        case totallyVaccinated = "totally_vaccinated"
        case today
    }

    public init(stateID: Int, id: Int, title: String, stateName: String, total: Int, partialVaccinated: Int, totallyVaccinated: Int, today: Int) {
        self.stateID = stateID
        self.id = id
        self.title = title
        self.stateName = stateName
        self.total = total
        self.partialVaccinated = partialVaccinated
        self.totallyVaccinated = totallyVaccinated
        self.today = today
    }
}

// MARK: - Last30DaysAefi
public struct Last30DaysAefi: Codable {
    public let vaccineDate: String
    public let aefi: Int

    enum CodingKeys: String, CodingKey {
        case vaccineDate = "vaccine_date"
        case aefi
    }

    public init(vaccineDate: String, aefi: Int) {
        self.vaccineDate = vaccineDate
        self.aefi = aefi
    }
}

// MARK: - Last5DaySessionStatus
public struct Last5DaySessionStatus: Codable {
    public let sessionDate: String
    public let total, planned, ongoing, completed: Int

    enum CodingKeys: String, CodingKey {
        case sessionDate = "session_date"
        case total, planned, ongoing, completed
    }

    public init(sessionDate: String, total: Int, planned: Int, ongoing: Int, completed: Int) {
        self.sessionDate = sessionDate
        self.total = total
        self.planned = planned
        self.ongoing = ongoing
        self.completed = completed
    }
}

// MARK: - Last7DaysRegistration
public struct Last7DaysRegistration: Codable {
    public let regDate: String
    public let total, male, female, others: Int

    enum CodingKeys: String, CodingKey {
        case regDate = "reg_date"
        case total, male, female, others
    }

    public init(regDate: String, total: Int, male: Int, female: Int, others: Int) {
        self.regDate = regDate
        self.total = total
        self.male = male
        self.female = female
        self.others = others
    }
}

// MARK: - TimeWiseTodayRegReport
public struct TimeWiseTodayRegReport: Codable {
    public let ts, timestamps, label, total: String
    public let age18, age45, age60, male: String
    public let female, others: String

    public init(ts: String, timestamps: String, label: String, total: String, age18: String, age45: String, age60: String, male: String, female: String, others: String) {
        self.ts = ts
        self.timestamps = timestamps
        self.label = label
        self.total = total
        self.age18 = age18
        self.age45 = age45
        self.age60 = age60
        self.male = male
        self.female = female
        self.others = others
    }
}

// MARK: - TopBlock
public struct TopBlock: Codable {
    public let sites, sessions: Sessions
    public let registration: Registration
    public let vaccination: Vaccination

    public init(sites: Sessions, sessions: Sessions, registration: Registration, vaccination: Vaccination) {
        self.sites = sites
        self.sessions = sessions
        self.registration = registration
        self.vaccination = vaccination
    }
}

// MARK: - Vaccination
public struct Vaccination: Codable {
    public let total, male, female, others, covishield, covaxin, sputnik, today, tot_dose_1, tot_dose_2, total_doses, aefi, today_dose_one, today_dose_two, today_male, today_female, today_others, today_aefi: Double?

    enum CodingKeys: String, CodingKey {
        case total, male, female, others, covishield, covaxin, sputnik, today, tot_dose_1, tot_dose_2, total_doses, aefi, today_dose_one, today_dose_two, today_male, today_female, today_others, today_aefi
    }
    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(total, forKey: .total)
//        try container.encode(male, forKey: .male)
//        try container.encode(female, forKey: .female)
//    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decodeIfPresent(Double.self, forKey: .total)
        male   = try values.decodeIfPresent(Double.self, forKey: .male)
        female      = try values.decodeIfPresent(Double.self, forKey: .female)
        others      = try values.decodeIfPresent(Double.self, forKey: .others)
        covishield      = try values.decodeIfPresent(Double.self, forKey: .covishield)
        covaxin      = try values.decodeIfPresent(Double.self, forKey: .covaxin)
        sputnik      = try values.decodeIfPresent(Double.self, forKey: .sputnik)
        today      = try values.decodeIfPresent(Double.self, forKey: .today)
        tot_dose_1      = try values.decodeIfPresent(Double.self, forKey: .tot_dose_1)
        tot_dose_2      = try values.decodeIfPresent(Double.self, forKey: .tot_dose_2)
        total_doses      = try values.decodeIfPresent(Double.self, forKey: .total_doses)
        aefi      = try values.decodeIfPresent(Double.self, forKey: .aefi)
        today_dose_one      = try values.decodeIfPresent(Double.self, forKey: .today_dose_one)
        today_dose_two      = try values.decodeIfPresent(Double.self, forKey: .today_dose_two)
        today_male      = try values.decodeIfPresent(Double.self, forKey: .today_male)
        today_female      = try values.decodeIfPresent(Double.self, forKey: .today_female)
        today_others      = try values.decodeIfPresent(Double.self, forKey: .today_others)
        today_aefi      = try values.decodeIfPresent(Double.self, forKey: .today_aefi)
    }
}

// MARK: - Registration
public struct Registration: Codable {
    public let total, cit18_45, cit45_Above, today: Int

    enum CodingKeys: String, CodingKey {
        case total
        case cit18_45 = "cit_18_45"
        case cit45_Above = "cit_45_above"
        case today
    }

    public init(total: Int, cit18_45: Int, cit45_Above: Int, today: Int) {
        self.total = total
        self.cit18_45 = cit18_45
        self.cit45_Above = cit45_Above
        self.today = today
    }
}

// MARK: - Sessions
public struct Sessions: Codable {
    public let total, govt, pvt: Int
    public let today: Int?

    public init(total: Int, govt: Int, pvt: Int, today: Int?) {
        self.total = total
        self.govt = govt
        self.pvt = pvt
        self.today = today
    }
}

// MARK: - VaccinationByAge
public struct VaccinationByAge: Codable {
    public let total, vac18_45, vac45_60, above60: Int

    enum CodingKeys: String, CodingKey {
        case total
        case vac18_45 = "vac_18_45"
        case vac45_60 = "vac_45_60"
        case above60 = "above_60"
    }

    public init(total: Int, vac18_45: Int, vac45_60: Int, above60: Int) {
        self.total = total
        self.vac18_45 = vac18_45
        self.vac45_60 = vac45_60
        self.above60 = above60
    }
}

// MARK: - VaccinationDoneByTime
public struct VaccinationDoneByTime: Codable {
    public let ts, timestamps, label: String
    public let count, doseOne, doseTwo: Int

    enum CodingKeys: String, CodingKey {
        case ts, timestamps, label, count
        case doseOne = "dose_one"
        case doseTwo = "dose_two"
    }

    public init(ts: String, timestamps: String, label: String, count: Int, doseOne: Int, doseTwo: Int) {
        self.ts = ts
        self.timestamps = timestamps
        self.label = label
        self.count = count
        self.doseOne = doseOne
        self.doseTwo = doseTwo
    }
}

// MARK: - VaccinationDoneByTimeAgeWise
public struct VaccinationDoneByTimeAgeWise: Codable {
    public let ts, timestamps, label: String
    public let total, vac18_45, vac45_60, vac60_Above: Int

    enum CodingKeys: String, CodingKey {
        case ts, timestamps, label, total
        case vac18_45 = "vac_18_45"
        case vac45_60 = "vac_45_60"
        case vac60_Above = "vac_60_above"
    }

    public init(ts: String, timestamps: String, label: String, total: Int, vac18_45: Int, vac45_60: Int, vac60_Above: Int) {
        self.ts = ts
        self.timestamps = timestamps
        self.label = label
        self.total = total
        self.vac18_45 = vac18_45
        self.vac45_60 = vac45_60
        self.vac60_Above = vac60_Above
    }
}
