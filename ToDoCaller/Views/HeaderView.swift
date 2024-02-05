//
//  HeaderView.swift
//  ToDoCaller
//
//  Created by emre on 5.02.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.orange)
                .rotationEffect(Angle(degrees: -15))
            
            VStack {
                Text("ToDoCaller")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                
                Text("Coming Soon")
                    .font(.system(size: 25))
                    .foregroundStyle(Color.gray)
                    
            }
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
        
        Spacer()
    }
}


#Preview {
    HeaderView()
}
