//
//  HomeView.swift
//  DesignCode
//
//  Created by Praveen on 02/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28.0, weight: .bold))
                Spacer()
                AvatarView(showProfile: $showProfile)
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36.0, height: 36.0)
                        .background(Color.white)
                    .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

                        
                }
                .sheet(isPresented: $showUpdate) {
                    ContentView()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0.0, y: 10.0, z: 0.0))
                        }
                    .frame(width: 275, height: 275)
                    }
                }
                .padding()
                .padding(.bottom, 30)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var logo: String
    var text: String
    var image: Image
    var color: Color
}


let sectionData = [
    Section(title: "Prototype Designs In SwiftUI", logo: "Logo1", text: "18 Sections", image: Image("Card1"), color: Color("card1")),
    Section(title: "Build a SwiftUI App", logo: "Logo1", text: "30 Sections", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color("card2")),
    Section(title: "SwiftUI Advanced", logo: "Logo1", text: "22 Sections", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
    
]
