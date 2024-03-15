//
//  ActivityView.swift
//  healthappforiwatch
//
//  Created by Pixel on 05/03/24.
//

import SwiftUI

struct ActivityView: View {
    
    
    @EnvironmentObject var manager : HealthController
    
    var body: some View {
        
        
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius (15)
            VStack {
                HStack (alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Daily steps")
                            .font (.system (size: 16))
                        Text("Goal: 10,000")
                            .font(.system (size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                        .foregroundColor(.green)
                }
                .padding()
                Text("1,712")
                    .font(.system (size: 24))
            }
            .padding()
           
        } .frame(height:200)
            ZStack {
                Color(uiColor: .systemGray6)
                    .cornerRadius (15)
                VStack {
                    HStack (alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Total Calories")
                                .font (.system (size: 16))
                            Text("Goal: 600")
                                .font(.system (size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        Image(systemName: "flame")
                            .foregroundColor(.green)
                    }
                    .padding()
                    Text("204")
                        .font(.system (size: 24))
                }
                .padding()
                
            }.frame(height:200)
        }
    }
    
    struct ActivityView_Previews: PreviewProvider {
        static var previews: some View {
            ActivityView()
        }
    }

