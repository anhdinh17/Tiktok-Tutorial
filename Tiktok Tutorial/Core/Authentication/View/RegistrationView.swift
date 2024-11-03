//
//  RegistrationView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/2/24.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel(authService: AuthService())
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("tikto-logo-image")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            // TextFields
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }
            
            // Sign up
            Button {
                Task {
                    await viewModel.createUser(withEmail:email,
                                         password: password,
                                         username: username,
                                         fullname: fullname)
                }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            // Disable Button if textFields not valid
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.7)
            
            Spacer()
            
            Divider()
            
            Button {
                // dismiss this screen and back to LoginView
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account ?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

//MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && !fullname.isEmpty
        && !username.isEmpty
    }
}

#Preview {
    RegistrationView()
}
