//
//  ContentView.swift
//  Day3
//
//  Created by Berk Gozek on 07/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var PplAndFood: [String:String] = [
                        "Ahmet":"Sıkma"
                        ,"Berk":"Hot Dog"
                        ,"Ceren":"Garlic Bread"
                        ,"Kami":"Not Cooked"
                        ,"Nil":"Not Cooked"
                        ,"Tansa":"Brownie"]
    
    @State var PplNum: [String:Int] = [
                        "Ahmet":1
                        ,"Berk":1
                        ,"Ceren":1
                        ,"Kami":0
                        ,"Nil":0
                        ,"Tansa":1]
    
    let ListofNames: Set<String> = ["Ahmet","Berk","Ceren","Kami","Nil","Tansa"]
    
    @State var InputName = ""
    @State var InputFood = ""
    var body: some View {
        VStack{
            Text("Food Order").font(.title)
            List {
                ForEach(PplAndFood.sorted(by: { $0.key < $1.key }), id: \.key) { (name, age) in
                    HStack {
                        Text("\(name) cooked \(PplNum[name] ?? 0) time(s)")
                        Spacer()
                        Text(age)
                    }
                }
                HStack{
                    Picker("Select", selection: $InputName) {
                        ForEach(Array(ListofNames), id: \.self) { name in
                            Text(name)
                        }
                    }
                    TextField("Food Made", text: $InputFood)
                }
                Button("Add Food"){
                    if ((InputFood != "") && (InputName != "")){
                        PplAndFood[InputName] = InputFood
                        PplNum[InputName] = (PplNum[InputName] ?? 0) + 1
                    }
                    InputName = "" ; InputFood = ""
                    
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
