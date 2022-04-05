//
//  ContentView.swift
//  InsuranceCosts
//
//  Created by Christian Riccio on 28/03/22.
//

import SwiftUI
import CoreML

struct ContentView: View {
    var sexs = ["Female", "Male"]
    var smokes = ["Yes", "No"]
    @State private var height: Float = 0.0
    @State private var weight: Float = 0.0
    @State private var age: Double = 0
    @State private var isEditingAge = false
    @State private var sex = "Female"
    @State private var children: Double = 0
    @State private var smoke = "Yes"
    @State private var bmi: Double = 0
    @State private var altertTitle = ""
    @State private var alertMessage=""
    @State private var isShowing = false
    @State var a: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing:20){
                HStack{
                    Text("Sex").font(.headline)
                Picker("Sex: ", selection: $sex){
                    ForEach(sexs, id: \.self){
                        Text($0)
                            .font(.headline)
                    }
                }.padding(.trailing,290)
                }
                HStack{
                    Text("Age")
                    TextField( "\(age.formatted())", value: $age, format: .number)
//                    Stepper("\(age.formatted())", in: 0...100, step: 0.5)
                    
                }.padding()

            Stepper(children == 1 ? "child": "\(children.formatted()) children", value: $children, in: 0...10, step: 1).padding()
            HStack{
                Text("Smoke").font(.headline)
                Picker("Smoke: ", selection: $smoke){
                    ForEach(smokes, id: \.self){
                        Text($0)
                            .font(.headline)
                    }
                }.padding(.trailing,290)
                
            }
            VStack{
                HStack{
                    Text("Weight (kg)").padding()
                TextField("Insert your weight: ", value: $height, format: .number)
                }
                HStack{
                    Text("Height (cm)").padding()
                TextField("Insert your height: ", value: $weight, format: .number)
                }

                Button("Calculate BMI", action: {
                   a = calcBmi(weightInKG: weight, heightInCM: height)
                })
                Text("\(a)")
                
            }
                
                Spacer()
                
                Button("Calculate Healtcare Costs", action: calculateCosts).font(.headline).padding().alert(altertTitle, isPresented: $isShowing){
                    Button("ok"){ }
                } message: {
                    Text("\(alertMessage) $")
                }
            }.navigationTitle("Healthcare Costs").font(.headline)
        }
        
        }

    func calculateCosts() {
        do {
            let config = MLModelConfiguration()
            let model = try MedicalCosts(configuration: config)
            let prediction =  try model.prediction(age: Double(age), sex: sex, bmi: Double(a)!, children: children, smoker: smoke)
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
    func calcBmi(weightInKG:Float, heightInCM: Float)->String{
        let bmi = weightInKG / ((heightInCM * heightInCM )/1000)
        return String(round(bmi))
    }
}


