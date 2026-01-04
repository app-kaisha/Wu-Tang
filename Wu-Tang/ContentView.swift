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
    @State private var staticCoderNameIs = ""
    @State private var wuTangName = ""
    @State private var imageName = "wu-tang"
    
    @FocusState private var IsFocused: Bool
    
    private let firstColumn = ["Algorithmic",
                               "Byte",
                               "Cache",
                               "Debug",
                               "Echo",
                               "Function",
                               "Git",
                               "Hex",
                               "Infinite",
                               "Java",
                               "Kernel",
                               "Logic",
                               "Module",
                               "Node",
                               "Object",
                               "Pixel",
                               "Query",
                               "Runtime",
                               "Script",
                               "Token",
                               "Undefined",
                               "Virtual",
                               "Web",
                               "Xcode",
                               "Yota",
                               "Zero"]
    private let secondColumn = ["$tack",
                                "Processor",
                                "Cipher",
                                "Daemon",
                                "EndPoint",
                                "Framework",
                                "Gateway",
                                "Hub",
                                "Interrupt",
                                "Crash",
                                "Loop",
                                "Module",
                                "Nexus",
                                "Optimizer",
                                "Protocol",
                                "Queue",
                                "Router",
                                "Stack",
                                "Thread",
                                "Update",
                                "Variable",
                                "Widget",
                                "Terminal",
                                "Yield",
                                "Zen",
                                "Ace",
                                "Breakpoint",
                                "Root",
                                "Instance",
                                "Access",
                                "Archive",
                                "Control",
                                "Justice"]
    
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
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled()
                .focused($IsFocused)
                .onSubmit{
                    createName()
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .onChange(of: IsFocused) {
                    if IsFocused == true {
                        enteredName = ""
                        staticCoderNameIs = ""
                        wuTangName = ""
                        
                        // image method to hide image - by removing
                        imageName = ""
                    }
                }
                .padding()
            Button {
                createName()
            } label: {
                Image("wu-tang-button")
                Text("Get It!")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2).bold()
            .foregroundStyle(.yellow)
            .tint(.black)
            .disabled(enteredName.isEmpty)
            
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
            Image(imageName)
                .resizable()
                .scaledToFit()
                //.opacity(IsFocused ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 0.4), value: imageName)
        }
    }
    
    private func getWuTangName(name: String) -> String {
        for firstNameIndex in 0...firstColumn.count - 1 {
            let char = firstColumn[firstNameIndex].first?.uppercased()
            if char == name.first?.uppercased() {
                let targetIndex = firstNameIndex-1 < 0 ? firstColumn.count-1 : firstNameIndex-1
                return "\(firstColumn[targetIndex]) \(secondColumn[Int.random(in: 0...secondColumn.count-1)])"
            }
        }
        
        return ""
    }
    
    private func createName() {
        staticCoderNameIs = "Your Wu-Tang Coder Name is:"
        wuTangName = getWuTangName(name: enteredName)
        IsFocused = false
        imageName = "wu-tang"
    }
    
    // class result
    private func getWuTangNameSolution(name: String) -> String {
        var localName = name
        let firstLetter = localName.removeFirst()
        var firstColumnIndex = 0
        for i in 0..<firstColumn.count {
            if firstColumn[i].first?.uppercased() == firstLetter.uppercased() {
                firstColumnIndex = i == 0 ? 25 : i-1
            }
        }
        
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement()!)"
    }
}

#Preview {
    ContentView()
}
