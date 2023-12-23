//
//  AccountView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/13.
//

import Foundation
import SwiftUI

struct AccountView: View {
    
    var body: some View {
        VStack {
            
            
            // Account Profile Image
            AccountImageView()
            
            // Account Information 
            HStack {
                Spacer()
                Text("Kranti Nebhwani")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(Color(.systemGray))
                    .padding(.top, 20)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Coder. Engineer.")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundStyle(Color(.systemGray2))
                Spacer()
            }
        }
    }
}

#Preview {
    AccountView()
}
