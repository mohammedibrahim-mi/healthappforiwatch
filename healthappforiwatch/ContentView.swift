//
//  ContentView.swift
//  healthappforiwatch
//
//  Created by Pixel on 05/03/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    @EnvironmentObject var manager : HealthController
    var body: some View {
        VStack{
            
            ActivityView()
                .environmentObject(manager)
           
            
        }
  
        .padding()
        .onAppear{
            manager.fetchTodaySteps()
            manager.fetchTodayCalories()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
