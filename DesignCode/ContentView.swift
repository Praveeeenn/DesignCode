//
//  ContentView.swift
//  DesignCode
//
//  Created by Praveen on 01/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show: Bool = false
    @State var viewState: CGSize = CGSize.zero
    @State var showCard: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1.0)
                .offset(y: showCard ? -200.0 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            BackCardView()
                .frame(width: showCard ? 300.0 : 340.0, height: 220.0)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(viewState)
                .offset(y: showCard ? -220 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(Angle(degrees: show ? 0 : 10.0))
                .rotationEffect(Angle(degrees: showCard ? -10.0 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5.0), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            BackCardView()
                .frame(width: 340.0, height: 220.0)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(viewState)
                .offset(y: showCard ? -170 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5.0))
                .rotationEffect(Angle(degrees: showCard ? -5.0 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5.0), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            CardView()
                .frame(width: showCard ? 375.0 : 340.0, height: 220.0)
                .background(Color.black)
                //.cornerRadius(20.0)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20.0)
                .offset(viewState)
                .offset(y: showCard ? -130 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture().onChanged({ (value) in
                    self.viewState = value.translation
                    self.show = true
                    }
                ).onEnded({ (value) in
                    self.viewState = .zero
                    self.show = false
                })
            )
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1.0, duration: 0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("UI Design")
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
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 6, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Praveen has achieved the UI Design course with approval from Google.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .shadow(radius: 20.0)
    }
}
