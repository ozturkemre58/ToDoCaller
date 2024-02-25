//
//  CallView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 25.02.2024.
//

import SwiftUI

struct CallView: View {
    
    @StateObject var viewModel = CallViewViewModel()
    var body: some View {
        VStack {
            Text("Incoming Call")
                .font(.title)
                .padding()
            

            Spacer()
            
            Button(action: {
                viewModel.stopRingtone()
                }) {
                Image(systemName: "phone.down")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            
            Button(action: {
//action
            }) {
                Image(systemName: "phone")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .padding()
        .onAppear() {
            //viewModel.playRingtone()
        }
    }
}

#Preview {
    CallView()
}
