//
//  ContentView.swift
//  Day2
//
//  Created by Berk Gozek on 07/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var Name = ""
    @State private var Dumb = false
    @State private var IsHeSure = false
    
    @State private var ShowTogg = false
    @State private var ShowButt = false
    
    
    var body: some View {
        VStack {
            TextField("What is your name?", text: $Name).disabled(ShowTogg)
            if !ShowButt{
                Button("Submit Name"){
                    ShowTogg = true
                    ShowButt = true
                }
            }
            
            if ShowTogg{
                Toggle(isOn: $Dumb) {
                    Text("Are You dumb, \(Name) ?")
                }
            }
            
            if Dumb{
                Toggle(isOn: $IsHeSure) {
                    Text("Are You sure, \(Name) ?")
                }
            }
            if Dumb && IsHeSure{
                Text("\(Name), you are dumb as hell.")
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
