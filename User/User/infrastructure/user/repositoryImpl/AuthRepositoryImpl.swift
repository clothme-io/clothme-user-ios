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


public class AuthRepositoryImpl : AuthRepository {
    
    public init() {}
    
    let authNetworkManager = AuthNetworkManager()
    
    public func emailSignIn<EmailSignInDTO>(with data: EmailSignInDTO, completion: @escaping (User?, String?) -> ()) {
        authNetworkManager.router.request(.signInWithEmail(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.authNetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "")
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(_, from: responseData)
//                        completion(apiResponse, nil)
                    }catch {
                        completion(nil, "")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func emailSignUp<EmailSignUpDTO>(with data: EmailSignUpDTO, completion: @escaping (Void?, String?) -> ()) {
        authNetworkManager.router.request(.signUpWithEmail(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.authNetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "")
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(_, from: responseData)
//                        completion(apiResponse, nil)
                    }catch {
                        completion(nil, "")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func facebookSignIn<FacebookSignInDTO>(with data: FacebookSignInDTO, completion: @escaping (User?, String?) -> ()) {
        authNetworkManager.router.request(.facebookSignIn(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.authNetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "")
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(_, from: responseData)
//                        completion(apiResponse, nil)
                    }catch {
                        completion(nil, "")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func googleSignIn<GoogleSignInDTO>(with data: GoogleSignInDTO, completion: @escaping (User?, String?) -> ())  {
        authNetworkManager.router.request(.googleSignIn(requestData: data as! Parameters)) { data, response, error in
            if error != nil {
                completion(nil, "")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.authNetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "")
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(_, from: responseData)
//                        completion(apiResponse, nil)
                    }catch {
                        completion(nil, "")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func signOut() {
        
    }
    
    func resetPassword<ResetPasswordDTO>(with data: ResetPasswordDTO, completion: @escaping (User?, String?) -> ()) {
        authNetworkManager.router.request(.resetPassword(requestData: data as! Parameters)) { (data, response, error) in
            if error != nil {
                completion(nil, "")
            }
        }
    }
    
    func forgotPassword<ForgotPasswordDTO>(with data: ForgotPasswordDTO, completion: @escaping (Void?, String?) -> ())  {
        authNetworkManager.router.request(.forgotPassword(requestData: data as! Parameters)) { (data, response, error) in
            if error != nil {
                completion(nil, "")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.authNetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "")
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(_, from: responseData)
//                        completion(apiResponse, nil)
                    }catch {
                        completion(nil, "")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
}
