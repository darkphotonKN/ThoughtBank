//
//  CreateThoughtFormView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/1.
//

import SwiftUI

struct CreateThoughtFormView: View {
    @State var thoughtTitle = ""
    @State var thoughtBody = ""
    
    func createThought() {
        var newThought = Thought(title: thoughtTitle, content: thoughtBody)
        let mobileIP = "172.20.10.4"
        let officeIP = "10.1.6.21"
        let url = "http://\(officeIP):3000/api/thoughts/create"
        
        // post to backend
        NetworkManager.shared.postRequest(url: url, payload: newThought) { result in
            // stop if no result was recieved
//            guard let result != result { return }
            
            print("postResult: \(result)")
            
        }
    }
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("What are you thinking...?")
                    .foregroundStyle(.gray)
                    .font(.system(size: 18, weight: .semibold))
                Image(systemName: "ellipsis.vertical.bubble.fill")
                    .foregroundStyle(.gray)
                Spacer()
            }
            
            
            // Form Fields
            ZStack {
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(height: 38)
                    .cornerRadius(8)
                    
                TextField("...Topic", text: $thoughtTitle)
                    .frame(height: 38)
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
            }
            ZStack {
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(height: 123)
                    .cornerRadius(8)
            TextField("...Content", text: $thoughtBody)
                .frame(height: 123)
                .foregroundColor(.white)
                .padding(.horizontal, 14)
            }
            
            HStack{
                Spacer()
               
                    
                Button(action: { createThought() } ) {
                    Text("...Make Thought")
                }
                    .background(.white)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
                Image(systemName: "pencil.line")
                    .foregroundStyle(.gray)
                    
               
            }.padding(.top, 12)
            
            
            Spacer()
        }.padding(.top, 22)
    }
}

#Preview {
//    HomeView()
    CreateThoughtFormView()
}
