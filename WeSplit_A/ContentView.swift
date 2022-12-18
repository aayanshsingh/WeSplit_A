//
//  ContentView.swift
//  WeSplit_A
//
//  Created by RegulusSpica1 on 17/12/22.
//

import SwiftUI

struct ContentView: View {
    let unit = ["Feet", "Kilometers", "Meters", "Miles", "Yards"]
    @State private var selectedInput = "Kilometers"
    @State private var selectedOutput = "Kilometers"
    @State private var inputValue = 0.0
    @FocusState private var inputIsFocused: Bool

    
    var result: String{
        let inputToMetersMultiplier: Double
        let outputFromMetersMultiplier: Double
        
        switch selectedInput{
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "Kilometers":
            inputToMetersMultiplier = 1000
        case "Miles":
            inputToMetersMultiplier = 1609.34
        case "Yards":
            inputToMetersMultiplier = 0.9144
        default:
            inputToMetersMultiplier = 1.0
            
        }
        
        switch selectedOutput{
        case "Feet":
            outputFromMetersMultiplier = 3.2084
        case "Kilometers":
            outputFromMetersMultiplier = 0.001
        case "Miles":
            outputFromMetersMultiplier = 0.000621371
        case "Yards":
            outputFromMetersMultiplier = 1.09361
        default:
            outputFromMetersMultiplier = 1.0
            
        }
        
        let inputInMeters = inputValue * inputToMetersMultiplier
        let outputFromMeters = inputInMeters * outputFromMetersMultiplier
        
        let outputValue = outputFromMeters.formatted()
        return "\(outputValue) \(selectedOutput.lowercased())"
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    
                TextField("Enter value", value: $inputValue, format: .number).keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                }header: {
                    Text("Enter the input value")
                }
                
                Picker("Input Unit", selection:
                        $selectedInput) {
                    ForEach (unit, id: \.self) {
                        Text ($0)
                    }
                }
                
                Picker("Output Unit", selection:
                        $selectedOutput) {
                    ForEach (unit, id: \.self) {
                        Text ($0)
                    }
                }
                
                Section{
                    
                Text(result)
                }header: {
                    Text("Result")
                }
                
            }.navigationTitle("Distance Converter")
            .toolbar{
                                    ToolbarItemGroup(placement: .keyboard){
                                        Spacer()
                                        
                                        Button("Done"){
                                            inputIsFocused = false
                                            
                                        }
                                    }
                                }
        }
    }
}
                

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
