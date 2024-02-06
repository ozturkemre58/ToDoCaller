//
//  HeaderView.swift
//  ToDoCaller
//
//  Created by emre on 5.02.2024.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    var angle: Double
    var bgColor: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text("\(title)")
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                
                Text("\(subtitle)")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                    
            }
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
        
        Spacer()
    }
}


#Preview {
    HeaderView(title: "ToDoCaller", subtitle: "Emre ÖZTÜRK", angle: -15, bgColor: .orange)
}
