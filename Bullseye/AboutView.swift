//
//  AboutView.swift
//  Bullseye
//
//  Created by 김호준 on 2020/06/02.
//  Copyright © 2020 김호준. All rights reserved.
//

import SwiftUI



struct AboutView: View {
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("AmericanTypewriter-Bold", size: 30))
                .padding(.top,20)
                .padding(.bottom,20)
        }
    }
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("AmericanTypewriter-Bold", size: 16))
                .padding(.leading,60)
                .padding(.trailing,60)
                .padding(.bottom,20)
        }
    }
    var body: some View {
        Group {
            VStack {
                Text("This is Bullseye Info Screen").modifier(AboutHeadingStyle())
                Text("Hello~~").modifier(AboutBodyStyle())
            }
            .background(Color.white)
        }
        .navigationBarTitle("Bullseye Info")
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
