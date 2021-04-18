//
//  ContentView.swift
//  Shared
//
//  Created by MANAS VIJAYWARGIYA on 24/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            //Snow
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 0)
                    .frame(height:100)
                    .foregroundColor(.white)
            }
            //Text
            VStack {
                Text("\(getNumberOfDaysUntilChristmas())")
                    .minimumScaleFactor(0.5)
                    .font(.custom("Kingthings Christmas 2", size: 100))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text("Merry")
                    .minimumScaleFactor(0.5)
                    .font(.custom("Kingthings Christmas 2", size: 100))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text("Christmas")
                    .minimumScaleFactor(0.5)
                    .font(.custom("Kingthings Christmas 2", size: 80))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .padding(.bottom,100)
            
            //Decorations
            VStack {
                HStack{
                    Spacer()
                    Image("moon")
                        .resizable()
                        .scaledToFit()
                        .frame(height:50)
                        .rotationEffect(.degrees(-10))
                        .padding()
                        .padding(.top,20)
                        .padding(.trailing,20)
                }
                Spacer()
                HStack{
                    Image("tree")
                        .resizable()
                        .scaledToFit()
                        .frame(height:250)
                        .rotationEffect(.degrees(-5))
                        .padding(.bottom,10)
                        .padding(.leading, -30)
                    Spacer()
                    Image("snowman")
                        .resizable()
                        .scaledToFit()
                        .frame(height:150)
                        .padding(.bottom,20)
                }
            }
        }
        .background(Color.init(red: 0/255.0, green: 14/255.0, blue: 51/255.0))
        .ignoresSafeArea()
    }
    
    func getNumberOfDaysUntilChristmas() -> Int {
        let christmasDateComponents = DateComponents(month: 12, day: 25, hour: 23, minute: 59, second: 59)
        let currentDate = Date()
        if let nextChristmasDate = Calendar.current.nextDate(after: currentDate, matching: christmasDateComponents, matchingPolicy: .strict), let daysUntilNextChristmas = Calendar.current.dateComponents([.day], from: currentDate, to: nextChristmasDate).day {
            return daysUntilNextChristmas
        }
        return 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
