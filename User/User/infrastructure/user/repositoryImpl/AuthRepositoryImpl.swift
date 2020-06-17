////
////  AuthRepositoryImpl.swift
////  User
////
////  Created by MACPRO on 2020-05-02.
////  Copyright © 2020 Paul Ikhane. All rights reserved.
////
//
//import Foundation
//import Core
//import Combine
//
//
//class AuthRepositoryImpl : AuthRepository {
//    func signOut() {
//        <#code#>
//    }
//    
//    func emailSignIn<EmailSignInDTO>(with data: EmailSignInDTO, completion: @escaping (Result<User, EmailSignInError>) -> Void) {
//        <#code#>
//    }
//    
//    func emailSignUp<EmailSignUpDTO>(with data: EmailSignUpDTO, completion: @escaping (Result<User, EmailSignInError>) -> Void) {
//        AuthService.shared.getAccess(with: .email) { (result: Result<User, AuthService.APIServiceError>) in
//            switch result {
//            case .success(let movieResponse):
//                print(movieResponse.results)
//            case .failure(let error):
//                print(error.localizedDescription)
//        }
//    }
//    
//    func facebookSignIn<FacebookSignInDTO>(with data: FacebookSignInDTO, completion: @escaping (Result<User, EmailSignInError>) -> Void) {
//        <#code#>
//    }
//    
//    func googleSignIn<GoogleSignInDTO>(with data: GoogleSignInDTO, completion: @escaping (Result<User, EmailSignInError>) -> Void) {
//        <#code#>
//    }
//    
//    func resetPassword<ResetPasswordDTO>(with data: ResetPasswordDTO, completion: @escaping (Result<User, EmailSignInError>) -> Void) {
//        <#code#>
//    }
//    
//    func forgotPassword<ForgotPasswordDTO>(with data: ForgotPasswordDTO, completion: @escaping (Result<Void, EmailSignInError>) -> Void) {
//        <#code#>
//    }
//    
//
//    
//    
//}
