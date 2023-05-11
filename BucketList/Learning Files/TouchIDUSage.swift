//
//  TouchIDUSage.swift
//  BucketList
//
//  Created by Hakan Aktürk on 13.01.2023.
//

import LocalAuthentication
import SwiftUI

struct TouchIDUSage: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {  success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
}

struct TouchIDUSage_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDUSage()
    }
}
