//
//  AuthRepositoryImpl.swift
//  User
//
//  Created by MACPRO on 2020-05-02.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core
import Networking


class AuthRepositoryImpl : AuthRepository {
    
    
    let authRouter = Router<AuthAPI>()
    
    func emailSignIn<EmailSignInDTO>(with data: EmailSignInDTO, completion: @escaping (User?, String?) -> ()) {
        authRouter.request(.signInWithEmail(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func emailSignUp<EmailSignUpDTO>(with data: EmailSignUpDTO, completion: @escaping (Void?, String?) -> ()) {
        authRouter.request(.signUpWithEmail(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func facebookSignIn<FacebookSignInDTO>(with data: FacebookSignInDTO, completion: @escaping (User?, String?) -> ()) {
        authRouter.request(.facebookSignIn(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func googleSignIn<GoogleSignInDTO>(with data: GoogleSignInDTO, completion: @escaping (User?, String?) -> ())  {
        authRouter.request(.googleSignIn(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func signOut() {
        
    }
    
    func resetPassword<ResetPasswordDTO>(with data: ResetPasswordDTO, completion: @escaping (User?, String?) -> ()) {
        authRouter.request(.resetPassword(requestData: data as! Parameters)) { (data, response, error) in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func forgotPassword<ForgotPasswordDTO>(with data: ForgotPasswordDTO, completion: @escaping (Void?, String?) -> ())  {
        authRouter.request(.forgotPassword(requestData: data as! Parameters)) { (data, response, error) in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    
    
}
