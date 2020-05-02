//
//  Home.swift
//  DesignCode
//
//  Created by Praveen on 02/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile: Bool = false
    @State var viewState: CGSize = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28.0, weight: .bold))
                    Spacer()
                    Button(action: { self.showProfile.toggle() }) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30.0)
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .scaleEffect(showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(self.viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
            .animation(Animation.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.0))
            .edgesIgnoringSafeArea(.all)
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 1000)
                .offset(y: viewState.height)
                .animation(Animation.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }.gesture(
                DragGesture().onChanged({ (value) in
                    self.viewState = value.translation
                }).onEnded({ (value) in
                    if self.viewState.height > 50 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                })
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
