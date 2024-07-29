import SwiftUI

struct ProfileAuthView: View {
    @EnvironmentObject var authManager: FirebaseAuthManager
    @State private var showAlert = false

    var body: some View {
        VStack {
            if let user = authManager.user {
                Text("Welcome, \(user.email ?? "User")")
                    .font(.title)
                    .padding()

                Button(action: {
                    showAlert = true
                }) {
                    Text("Log Out")
                        .frame(width: 140, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Log Out"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .destructive(Text("Yes")) {
                            do {
                                try authManager.logOut()
                            } catch let error {
                                print("Error logging out: \(error.localizedDescription)")
                            }
                        },
                        secondaryButton: .cancel()
                    )
                }
            } else {
                Text("You are not signed in")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }
}

struct ProfileAuthView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAuthView()
            .environmentObject(FirebaseAuthManager())
    }
}
