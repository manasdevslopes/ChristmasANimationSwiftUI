//
//  MerryChristmasEmitter.swift
//  MerryChristmas
//
//  Created by MANAS VIJAYWARGIYA on 25/12/21.
//

import SwiftUI

struct MerryChristmasEmmitter: View {
    var body: some View {
        MerryChristmasEmmitterHome()
    }
}

struct MerryChristmasEmmitter_Previews: PreviewProvider {
    static var previews: some View {
        MerryChristmasEmmitter()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

struct MerryChristmasEmmitterHome: View {
    @State var wish = false
    
    var body: some View {
        ZStack {
            Image("merrychristmas")
                .resizable()
                .frame(width: getRect().width)
            
            EmitterView()
                .scaleEffect(wish ? 1 : 0, anchor: .top)
                .opacity(wish ? 1 : 0)
                
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.spring()) {
                wish.toggle()
            }
        }
    }
}

func getRect()->CGRect {
    return UIScreen.main.bounds
}

// Emit Particle view.... CAEmitterLayer from UIKit
struct EmitterView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()
        
        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmitterCells()->[CAEmitterCell] {
        var emitterCells: [CAEmitterCell] = []
        
        for index in 1...12 {
            let cell = CAEmitterCell()
            
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            cell.color = getColor().cgColor
            // New Particle creation
            cell.birthRate = 4.5
            // Particle Existence...
            cell.lifetime = 20
            // velocity....
            cell.velocity = 120
            // Scale....
            cell.scale = 0.2
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            cell.yAcceleration = 40
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
    
    func getColor()->UIColor {
        let colors: [UIColor] = [.systemPink, .systemGreen, .systemRed, .systemOrange, .systemPurple, .white]
        return colors.randomElement()!
    }
    func getImage(index: Int)->String {
        if index < 4 {
            return "square"
        } else if index > 5 && index <= 8 {
            return "circle"
        } else {
            return "triangle"
        }
    }
}

