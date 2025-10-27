//
//  ContentView.swift
//  LoginDemo
//
//  Created by Dan Kerkove on 10/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            WelcomeView(username: username)
        } else {
            VStack(spacing: 24) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: handleLogin) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .alert("Invalid credentials", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }

    func handleLogin() {
        // Simple static validation
        if username.lowercased() == "test" && password == "1234" {
            isLoggedIn = true
        } else {
            showingAlert = true
        }
    }
}

struct WelcomeView: View {
    let username: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(username)!")
                .font(.title)
                .bold()
            Button("Log Out") {
                // For simplicity, pop back to login by reloading view
                exit(0)
            }
        }
    }
}

#Preview {
    ContentView()
}

