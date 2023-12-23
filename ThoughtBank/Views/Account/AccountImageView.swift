//
//  AccountImageView.swift
//  ThoughtBank
//
//  Created by Kranti on 2023/12/24.
//

import Foundation
import SwiftUI
import PhotosUI

struct AccountImageView: View {
    @State private var choosingImage: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    private var imageHeight: CGFloat = 100
    private var imageWidth: CGFloat = 100
    
    var body: some View {
        ZStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .frame(width: imageWidth, height: imageHeight)
                    .foregroundStyle(Color(.systemGray2))
                
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color(.systemGray2))
            }
            // MARK: Using Photospicker to update the image
            PhotosPicker(selection: $choosingImage, matching: .images) {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color(.systemGray))
                    .padding([.top, .leading], imageWidth)
            }.onChange(of: choosingImage) {
                // when image is selected we resolve the image
                // chosen and set it to the selectedImage to re-render
                // the view
                Task {
                    
                    if let image = choosingImage, let data = try? await image.loadTransferable(type: Data.self) {
                        
                        if let resolvedImage = UIImage(data: data) {
                            // set to the state image
                            selectedImage = resolvedImage
                        }
                    }
                    
                }
            }
            
        }
    }
    
}

#Preview {
    AccountImageView()
}
