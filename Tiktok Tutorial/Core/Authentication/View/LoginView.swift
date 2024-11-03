//
//  LoginView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/2/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    // Dependency Injection
    @StateObject var viewModel = LoginViewModel(authService: AuthService())
    
    var body: some View {
        NavigationStack {
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
                }
                
                // Forgot password button
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // Login Button
                Button {
                    Task {
                        await viewModel.login(withEmail:email,
                                        password: password)
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                // Disable Button if textFields not valid
                .disabled(!formIsValid) // formIsValid = True -> disabled = False
                .opacity(formIsValid ? 1 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack {
                        Text("Don't have an account ?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

//MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        // Return true if email is not empty AND
        // email contains @ AND
        // password is not empty
        return !email.isEmpty && email.contains("@") && !password.isEmpty
    }
}

#Preview {
    LoginView()
}
