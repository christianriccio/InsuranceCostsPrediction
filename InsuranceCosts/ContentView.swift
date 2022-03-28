//
//  ContentView.swift
//  InsuranceCosts
//
//  Created by Christian Riccio on 28/03/22.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var age: Double = 0
    @State private var isEditingAge = false
    @State private var sex = ""
    @State private var children: Double = 0
    @State private var smoke = ""
    @State private var bmi: Double = 0
    @State private var isEditingBmi = false
    
    @State private var altertTitle = ""
    @State private var alertMessage=""
    @State private var isShowing = false
    
    var body: some View {
            Form {
                HStack{
                    Text("Sex").font(.headline).padding()
                    TextField("male or female",text: $sex).padding()
                }
                HStack{
                    Stepper("\(age.formatted()) years old", value: $age, in: 0...100, step: 0.5).padding()
                }
                Stepper(children == 0 ? "child": "\(children.formatted()) children", value: $children, in: 0...10, step: 1).padding()
                HStack{
                    Text("Smoke").font(.headline).padding()
                    TextField("yes or no",text: $smoke).padding()
                }
                HStack{
                    Text("BMI").font(.headline).padding()
                    Slider(value: $bmi, in: 0...100,
                           onEditingChanged: { editing in
                        isEditingBmi = editing}).padding()
                    Text("\(bmi.formatted())")
                        .foregroundColor(isEditingAge ? .red : .black).padding()
                }
            }
        Button("Calculate Insurance Costs", action: calculateCosts).font(.headline).padding().alert(altertTitle, isPresented: $isShowing){
            Button("ok"){ }
        } message: {
            Text("\(alertMessage) $")
        }
    }
    func calculateCosts() {
        do {
            let config = MLModelConfiguration()
            let model = try MedicalCosts(configuration: config)
            let prediction =  try model.prediction(age: age, sex: sex, bmi: bmi, children: children, smoker: smoke)
            let charges = prediction.charges.formatted()
            print("estimated insurance charges: \(prediction.charges.formatted())")
            altertTitle = "Your estimated insurance costs are:"
            alertMessage = charges
        } catch {
            altertTitle = "Error"
            alertMessage = "An error occours while making the prediction"
        }
        isShowing = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
