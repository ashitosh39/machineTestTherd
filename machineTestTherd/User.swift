//
//  User.swift
//  machineTestTherd
//
//  Created by Macintosh on 19/01/24.
//

import Foundation

struct User: Codable
{
    var  address: Address
    var username: String
    var email : String
    var name : Name
}

struct Address: Codable
{
    var geolocation : Geolocation
    let city, street: String
    let number: Int
    let zipcode: String
   
    
}
struct  Geolocation : Codable{
    var lat : String
    var long : String
}
struct Name: Codable
{
    var firstname : String
    var lastname: String
}
