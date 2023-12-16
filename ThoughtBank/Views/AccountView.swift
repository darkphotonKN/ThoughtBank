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
        HStack {
            Text("Welcome back, Kranti.")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color(.systemGray))
            Spacer()
        }
    }
}

#Preview {
    AccountView()
}
