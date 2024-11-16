//
//  UploadPostView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/16/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                // .vertical makes the text go to other line when it reaches its bound
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
                Spacer()
                
                Image("tikto-logo-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            Divider()
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    UploadPostView()
}
