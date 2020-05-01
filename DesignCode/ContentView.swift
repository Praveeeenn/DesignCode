//
//  ContentView.swift
//  DesignCode
//
//  Created by Praveen on 01/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: 300.0, height: 220.0)
            .background(Color.blue)
            .cornerRadius(20.0)
            .shadow(radius: 20.0)
            .offset(x: 0, y: -20)
            VStack {
                HStack {
                    VStack {
                        Text("UI Desgin")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Certificate")
                            .foregroundColor(Color("accent"))
                    }
                    Spacer()
                    Image("Logo1")
                }
                .padding()
                Spacer()
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300.0, height: 110.0, alignment: .top)
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(20.0)
            .shadow(radius: 20.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
