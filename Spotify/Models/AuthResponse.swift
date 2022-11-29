//
//  AuthResponse.swift
//  Spotify
//
//  Created by Pratyush  on 9/7/21.
//

import Foundation

//"access_token" = "BQA2ozjxID5yfn_FSDewDGLzKn4uD3N5DVyCZdxiQruBBn1JJL8wFL4HDlruFA4Lzpsd29wbZHay1Zzq50kNPLuavJ7uByxJwEGDYn55Qdn35BoLBuS8x6VfOfklg1u66m3bOA8PYHpRxPVHSS49U4r8l_D3BQu_exnTeA";
//"expires_in" = 3600;
//"refresh_token" = "AQCx6viokZ98WeAbAO0_gCs4ftEOZ7uAtKhYNxZmMLVSXkr7omESCXJSt6Pqor-zzQfaB2iznmwEvZUJ76GRhmS-env4LEHZvpK3BzvfMWK9eF0KLsPqYyJno0JLb6GVqC8";
//"token_type" = Bearer;

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let token_type: String
}
