import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    @State private var showLogIn = false
    @State private var showSignUp = false
    @State private var showProfile = false

    var body: some View {
        ZStack {
            // Full-screen blue background
            Color.blue
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                // TabView for images with pagination
                TabView(selection: $currentIndex) {
                    ForEach(0..<4) { index in
                        Image(systemName: "globe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding(.top, 50)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 450)

                Spacer()

                // White card taking up half the screen
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.ultraThinMaterial)
                        .frame(height: .infinity)
                        .edgesIgnoringSafeArea(.bottom)

                    VStack {
                        Spacer()

                        // Title and Subtitle
                        Text("Shop the world\nwith confidence")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        Spacer()

                        // Buttons
                        HStack {
                            Button(action: {
                                showLogIn = true
                            }) {
                                Text("Log In")
                                    .frame(width: 140, height: 50)
                                    .background(Color.white)
                                    .foregroundColor(.blue)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .sheet(isPresented: $showLogIn) {
                                LogInView().environmentObject(FirebaseAuthManager())
                            }

                            Button(action: {
                                showSignUp = true
                            }) {
                                Text("Sign Up")
                                    .frame(width: 140, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(25)
                                    .padding(.horizontal)
                            }
                            .sheet(isPresented: $showSignUp) {
                                SignUpView().environmentObject(FirebaseAuthManager())
                            }
                        }
                        .padding(.bottom, 30)

                        Button(action: {
                            showProfile = true
                        }) {
                            Text("Profile")
                                .frame(width: 140, height: 50)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .sheet(isPresented: $showProfile) {
                            ProfileAuthView().environmentObject(FirebaseAuthManager())
                        }
                        .padding(.bottom, 30)

                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(FirebaseAuthManager())
    }
}
