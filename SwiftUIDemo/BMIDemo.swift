//
//  BMIDemo.swift
//  SwiftUIDemo
//
//  Created by henryge on 2022/10/21.
//

import SwiftUI

struct BMIDemo: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    var body: some View {
        VStack{
            Text("BMI Calculator:").font(.largeTitle)
            TextField("Enter Weight (in kilograms)",text: $weightText) .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            
            TextField("Enter Height (in meters)",text: $heightText) .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            
            Button(action:{
                let weight = Double(self.weightText)!
                let height = Double(self.heightText)!
                self.bmi = weight/(height * height)
                
                if self.bmi < 18.5 {
                    self.classification = "Underweight"
                } else if self.bmi < 24.9 {
                    self.classification = "Healthy weight"
                } else if self.bmi < 29.9 {
                    self.classification = "Overweight"
                } else {
                    self.classification = "Obese"
                }
            }){
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            Text("BMI: \(self.bmi, specifier: "%.1f"), \(self.classification) ") .font(.title) .padding()
        }.padding()
    }
}
