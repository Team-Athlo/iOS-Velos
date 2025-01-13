//
//  HomeViewModel.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import Foundation
import HealthKit

final class HomeViewModel {

    private let healthStore = HKHealthStore()

    init() {
        let toShare: Set<HKSampleType> = [
            HKSampleType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .cyclingPower)!,
            HKObjectType.quantityType(forIdentifier: .cyclingSpeed)!,
            HKObjectType.quantityType(forIdentifier: .cyclingCadence)!,
            HKObjectType.quantityType(forIdentifier: .cyclingFunctionalThresholdPower)!,
            HKObjectType.quantityType(forIdentifier: .distanceCycling)!
        ]

        let toRead: Set<HKObjectType> = [
            HKSampleType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .cyclingPower)!,
            HKObjectType.quantityType(forIdentifier: .cyclingSpeed)!,
            HKObjectType.quantityType(forIdentifier: .cyclingCadence)!,
            HKObjectType.quantityType(forIdentifier: .cyclingFunctionalThresholdPower)!,
            HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
        ]

        healthStore.requestAuthorization(toShare: toShare, read: toRead) { (success, error) in
            if error != nil { } else {
                if success {
                    print("권한 있음")
                } else {
                    print("권한 없음")
                }
            }
        }
    }

    func getData(completion: @escaping (Double) -> Void) {
        guard let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceCycling) else {
            print("Distance Cycling type is unavailable.")
            return
        }

        // 날짜 범위 설정
        let startDate = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        // 쿼리 생성
        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, statistics, error in
            if let error = error {
                print("Error fetching statistics: \(error.localizedDescription)")
                return
            }

            if let sum = statistics?.sumQuantity() {
                let distance = sum.doubleValue(for: .meter())
                print("Total Distance Cycling in last 3 months: \(distance * 0.001) meters")
                completion(distance)
            } else {
                print("No data available for the given period.")
            }
        }

        healthStore.execute(query)
    }
}
