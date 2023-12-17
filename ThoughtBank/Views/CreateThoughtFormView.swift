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
    @Binding var detailNavigation: DetailViewsState
    
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
            
            // Submit Button
            HStack{
                Spacer()
               
                Button(action: {
                    // POST new thought
                    createThought()
                    
                    // switch back to main view 
                    detailNavigation = .list
                } ) {
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
    
    func createThought() {
        let newThought = Thought(title: thoughtTitle, content: thoughtBody)
        let mobileIP = "172.20.10.4"
        let homeWifiIP = "10.0.0.110"
        let officeIP = "10.1.6.21"
        let url = "http://\(homeWifiIP):3000/api/thoughts/create"
        
        // post to backend
        NetworkManager.shared.postRequest(url: url, payload: newThought) { result in
            // stop if no result was recieved
            switch result {
            case .success(let data):
                // decode JSON with string
                if let encodedStr = String(data: data, encoding: .utf8) {
                    print("post repsonse data: \(encodedStr)")
                }
                
            case .failure(let error):
                print("Error while posting: \(error)")
                    
            }
            
        }
    }
}

#Preview {
//    HomeView()
    CreateThoughtFormView(detailNavigation: .constant(DetailViewsState.create))
}
