//
//  ContentView.swift
//  Day1
//
//  Created by Berk Gozek on 07/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var Rad: Int = 100
    @State private var Tex: String = ""
    var body: some View {
        
        VStack {
            HStack{
                Text("Enter Radius of Circle: ")
                TextField("Radius", value: $Rad, formatter: NumberFormatter())
            }
            ZStack{
                Circle()
                    .frame(width: CGFloat(Rad) * 2, height: CGFloat(Rad) * 2 , alignment: .center)
                    .overlay(
                        Text(Tex)
                            .font(.system(size: 24))
                            .foregroundColor(.white))
                    .mask(
                        Circle()
                        .frame(width: CGFloat(Rad) * 2, height: CGFloat(Rad) * 2 , alignment: .center)
                        )
            }
            
                
                
            HStack{
                Text("Enter Text inside of Circle: ")
                TextField("Text", text: $Tex)
            }
        }
        .padding()
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
