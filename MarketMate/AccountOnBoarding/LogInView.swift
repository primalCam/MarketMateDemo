import SwiftUI

struct LogInView: View {
    @EnvironmentObject var authManager: FirebaseAuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.largeTitle)
                .padding()
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()
            
            Button(action: {
                authManager.logIn(email: email, password: password) { result in
                    switch result {
                    case .success(_):
                        alertMessage = "User logged in successfully!"
                        showAlert = true
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        alertMessage = "Log In Error: \(error.localizedDescription)"
                        showAlert = true
                    }
                }
            }) {
                Text("Log In")
                    .frame(width: 140, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Log In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(FirebaseAuthManager()) // Add environment object for preview
    }
}
