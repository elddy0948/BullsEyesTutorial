//
//  ContentView.swift
//  Bullseye
//
//  Created by 김호준 on 2020/05/25.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var totalScore: Int = 0
    @State var round: Int = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("AmericanTypewriter-Bold", size: 18))
        }
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("AmericanTypewriter-Bold", size: 18))
        }
    }
    
    
    var body: some View {
        VStack {
            //Target row
            HStack {
                Text("Put Bullseyes as close as you can : ")
                    .fontWeight(.semibold)
                    .modifier(LabelStyle())
                Text("\(self.target)")
                    .modifier(ValueStyle())
                }.padding(.top, 20)
            Spacer()
            
            //Slider row
            HStack {
                Text("1")
                    .modifier(LabelStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100")
                    .modifier(LabelStyle())
            }.padding(.trailing, 10).padding(.leading, 10)
            //Button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) {
                () -> Alert in
                let roundedValue:Int = Int(self.sliderValue.rounded())
                return Alert(title: Text(alertTitle()), message: Text("The Slider's Value is \(roundedValue)" +
                    "You Scored \(self.pointsForCurrentRound())points this round"
                ),dismissButton: .default(Text("Awesome")){
                    self.totalScore = self.totalScore + self.pointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.round = self.round + 1
                })
            }
            .background(Image("Button"))
            
            Spacer()
            //Score row
            HStack {
                Button(action: {self.startOver()}){
                    HStack{
                        Image("StartOverIcon")
                        Text("Start Over")
                    }
                }.background(Image("Button"))
                Spacer()
                Text("Score:")
                    .modifier(LabelStyle())
                Text("\(totalScore)")
                    .modifier(ValueStyle())
                Spacer()
                Text("Round")
                    .modifier(LabelStyle())
                Text("\(round)")
                    .modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()){
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                    }.padding(.leading,20)
                }.background(Image("Button"))
            }.padding(.bottom,20).padding(.leading, 10).padding(.trailing, 10)
        }
        .background(Image("Background"),alignment: .center)
        .navigationBarTitle("BullsEye")
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else  {
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect"
        } else if difference < 5 {
            title = "You almost had it!"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    func startOver() {
        totalScore = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
