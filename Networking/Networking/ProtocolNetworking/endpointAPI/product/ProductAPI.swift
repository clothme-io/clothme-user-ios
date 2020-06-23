//
//  ProductAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public enum ProductAPI {
    case getProductByProductId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getProductByProductName(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeProduct(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    
    // GET FIT PRODUCT
    case getFitProductByProductCategory(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByProductCategoryType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByUserBrand(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByProductYear(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByBrandId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByCountry(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByUserId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByCity(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByLocation(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByProductType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    
    
    //GET UNFIT PRODUCT
    case getUnFitProductByProductCategory(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByProductCategoryType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByUserBrand(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByProductYear(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByBrandId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByCountry(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByUserId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByCity(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByLocation(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getUnFitProductByProductType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension ProductAPI: EndPointType {
    var environmentBaseURL : String {
        let productNetworkManager = ProductNetworkManager()
        switch productNetworkManager.environment {
        case .production: return "https://getclothme.com/customer/api"
        case .qa: return "https://getclothme.com/qa/api"
        case .staging: return "https://getclothme.com/staging/api"
        }
    }
    
    public var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .getProductByProductId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_product_by_product_id"
        case .getProductByProductName(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_product_by_product_name"
        case .removeProduct(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_product"
            
            
        // GET FIT PRODUCT
        case .getFitProductByProductCategory(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_product_category"
        case .getFitProductByProductCategoryType(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_product_category_type"
        case .getFitProductByUserBrand(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_user_brand"
        case .getFitProductByProductYear(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_product_year"
        case .getFitProductByBrandId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_brand_id"
        case .getFitProductByCountry(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_country"
        case .getFitProductByUserId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_user_id"
        case .getFitProductByCity(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_city"
        case .getFitProductByLocation(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_location"
        case .getFitProductByProductType(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_fit_product_by_product_type"
            
            
        // GET UNFIT PRODUCT
        case .getUnFitProductByProductCategory(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_product_category"
        case .getUnFitProductByProductCategoryType(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_product_category_type"
        case .getUnFitProductByUserBrand(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_user_brand"
        case .getUnFitProductByProductYear(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_product_year"
        case .getUnFitProductByBrandId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_brand_id"
        case .getUnFitProductByCountry(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_country"
        case .getUnFitProductByUserId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_user_id"
        case .getUnFitProductByCity(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_city"
        case .getUnFitProductByLocation(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_location"
        case .getUnFitProductByProductType(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_un_fit_product_by_product_type"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {

        case .getProductByProductId:
            return .get
        case .getProductByProductName:
            return .get
        case .removeProduct:
            return .patch
            
        
        // GET FIT PRODUCT
        case .getFitProductByProductCategory:
            return .get
        case .getFitProductByProductCategoryType:
            return .get
        case .getFitProductByUserBrand:
            return .get
        case .getFitProductByProductYear:
            return .get
        case .getFitProductByBrandId:
            return .get
        case .getFitProductByCountry:
            return .get
        case .getFitProductByUserId:
            return .get
        case .getFitProductByCity:
            return .get
        case .getFitProductByLocation:
            return .get
        case .getFitProductByProductType:
            return .get
            
            
        // GET UNFIT PRODUCT
        case .getUnFitProductByProductCategory:
            return .get
        case .getUnFitProductByProductCategoryType:
            return .get
        case .getUnFitProductByUserBrand:
            return .get
        case .getUnFitProductByProductYear:
            return .get
        case .getUnFitProductByBrandId:
            return .get
        case .getUnFitProductByCountry:
            return .get
        case .getUnFitProductByUserId:
            return .get
        case .getUnFitProductByCity:
            return .get
        case .getUnFitProductByLocation:
            return .get
        case .getUnFitProductByProductType:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .getProductByProductId(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getProductByProductName(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeProduct(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
            
         
        // GET FIT PRODUCT
        case .getFitProductByProductCategory(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByProductCategoryType(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByUserBrand(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByProductYear(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByBrandId(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByCountry(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByUserId(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByCity(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByLocation(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getFitProductByProductType(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
            
        
        // GET UNFIT PRODUCT
        case .getUnFitProductByProductCategory(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByProductCategoryType(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByUserBrand(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByProductYear(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByBrandId(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByCountry(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByUserId(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByCity(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByLocation(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUnFitProductByProductType(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .getProductByProductId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getProductByProductName(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .removeProduct(requestData: _, queryString: _, header: let header):
            return .some(header)
            
        
        // GET FIT PRODUCT
        case .getFitProductByProductCategory(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByProductCategoryType(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByUserBrand(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByProductYear(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByBrandId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByCountry(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByUserId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByCity(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByLocation(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getFitProductByProductType(requestData: _, queryString: _, header: let header):
            return .some(header)
            
            
        // GET UNFIT PRODUCT
        case .getUnFitProductByProductCategory(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByProductCategoryType(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByUserBrand(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByProductYear(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByBrandId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByCountry(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByUserId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByCity(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByLocation(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUnFitProductByProductType(requestData: _, queryString: _, header: let header):
            return .some(header)
        }
    }
    
    
}
