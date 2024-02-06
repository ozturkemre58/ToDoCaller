//
//  TLButton.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 6.02.2024.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let bgColor: Color
    let action: () -> Void
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }.padding()    }
}

#Preview {
    TLButton(title: "Test Button", bgColor: .green) {
        
    }
}
