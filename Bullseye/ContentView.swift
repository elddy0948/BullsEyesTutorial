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

    var body: some View {
        VStack {
            //Target row
            HStack {
                Text("Put Bullseyes as close as you can : ")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Text("100")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                }.padding(.top, 20)
            Spacer()
            
            //Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }.padding(.trailing, 10).padding(.leading, 10)
            //Button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) {
                () -> Alert in
                var roundedValue:Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"), message: Text("The Slider's Value is \(roundedValue)"),dismissButton: .default(Text("Awesome")))
            }
            
            Spacer()
            //Score row
            HStack {
                Button(action: {}, label: {
                    Text("Start Over")
                })
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round")
                Text("999")
                Spacer()
                Button(action: {}, label:  {
                    Text("Info")
                })
            }.padding(.bottom,20).padding(.leading, 10).padding(.trailing, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
