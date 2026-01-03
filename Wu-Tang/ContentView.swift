//
//  ContentView.swift
//  Wu-Tang
//
//  Created by app-kaihatsusha on 03/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredName = ""
    @State private var staticCoderNameIs = "Your Wu-Tang Coder Name is:"
    @State private var wuTangName = "Undefined Breakpoint"
    
    var body: some View {
        VStack {
            Text("Wu-Tang\nCoder Name Generator")
                .font(.title)
                .fontWeight(.black)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.bottom)
                .background(.black)
            
            Spacer()
            TextField("Enter name here", text: $enteredName)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding()
            Button {
                
            } label: {
                    Image("wu-tang-button")
                    Text("Get It!")

                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2).bold()
            .foregroundStyle(.yellow)
            .tint(.black)
            
            VStack{
                Text(staticCoderNameIs)
                    .multilineTextAlignment(.leading)
                    
                Text(wuTangName)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            }
            .font(.largeTitle)
            .frame(height: 130)
            .minimumScaleFactor(0.5)
            
            
            Spacer()
            
            Image("wu-tang")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    ContentView()
}
