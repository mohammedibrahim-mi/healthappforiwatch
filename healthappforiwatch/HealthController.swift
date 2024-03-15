//
//  HealthController.swift
//  healthappforiwatch
//
//  Created by Pixel on 05/03/24.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthController : ObservableObject  {
    
    
    let healthStore = HKHealthStore()
    var stepsdata = ""
    var caloriedata = ""
    
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let healthTypes: Set = [steps,calories]
        Task {
            do {
                try await healthStore.requestAuthorization (toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
            } catch {
                print("errror fetching health data")
            }
        }}
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .distantPast, end: Date())
        let query = HKStatisticsQuery (quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity (), error == nil else {
                print("error fetching todays step data")
                print(error ?? "")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            print ("stepCount")
            self.stepsdata = String(stepCount)
            print (stepCount)
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories () {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples (withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery (quantityType: calories, quantitySamplePredicate: predicate) {_, result, error in
            guard let quantity = result?.sumQuantity (), error == nil else {
                print("error fetching todays calorie data")
                print(error ?? "")
                return
            }
            let stepCount = quantity.doubleValue(for: .kilocalorie())
            self.caloriedata = String(stepCount)
            print (stepCount)
        }
        healthStore.execute(query)
    }
    
    
}
