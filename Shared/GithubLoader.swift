//
//  GithubLoader.swift
//  MerryChristmas
//
//  Created by MANAS VIJAYWARGIYA on 31/12/20.
//

import SwiftUI

struct GithubLoader: View {
    
    // MARK:- variables
    @State var resetStrokes: Bool = true
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            OctocatShape()
                .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round, miterLimit: 5))
                .foregroundColor(Color.white)
                .opacity(0.35)
            OctocatShape()
                .trim(from: strokeStart, to: strokeEnd)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 10))
                .foregroundColor(Color.white)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) {timer in
                        if(self.strokeEnd >= 1) {
                            if(self.resetStrokes) {
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
                                    self.strokeEnd = 0
                                    self.strokeStart = 0
                                    self.resetStrokes.toggle()
                                }
                                self.resetStrokes = false
                            }
                        }
                        withAnimation(Animation.easeOut(duration: 0.5)){
                            self.strokeEnd += 0.1
                            self.strokeStart = self.strokeEnd - 0.3
                        }
                    }
                }
            VStack {
                Spacer()
                Text("Happy New Year")
                    .minimumScaleFactor(0.5)
                    .font(.custom("Kingthings Christmas 2", size: 50))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text("🎉🎊💥😁😀")
                    .minimumScaleFactor(0.5)
                    .font(.custom("Kingthings Christmas 2", size: 50))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .padding(.bottom,200)
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text("From @manas.ios_developpeur")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                        .opacity(0.5)
                }.padding(.trailing, 16)
                HStack {
                    Spacer()
                    Text("SwiftUI")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                        .opacity(0.5)
                }.padding(.trailing, 16)
            }
            .padding(.bottom,100)
        }
    }
}

struct GithubLoader_Previews: PreviewProvider {
    static var previews: some View {
        GithubLoader()
    }
}
