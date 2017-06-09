//
//  ViewController.swift
//  httpTutorial
//
//  Created by miks on 09/06/2017.
//  Copyright © 2017 miks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onGetTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    if let dictionary = json as? [String: Any] {
                        if let body = dictionary["title"] as? String {
                            print("HERE START")
                            print(body)
                            print("HERE END")
                        }
                    }
                } catch {
                    print(error)
                }
                
            }
            }.resume()
    }
    @IBAction func onPostTapped(_ sender: Any) {
        let parameters = ["username": "amerty95@hotmail.com", "password": "12071995"]
        
        
        guard let url = URL(string: "https://beta.miksinvest.com/auth/login") else { return }
      //  guard let url = URL(string: "http://ip.jsontest.com/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE")
                print(response)
            }
            
            if let data = data {
                print("DATA")
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("JSON")
                    print(json)
                    if let dictionary = json as? [String: Any] {
                        if let status = dictionary["message"] as? String {
                            print("HERE")
                            print(status)
                        }
                    }
                    
                } catch {
                    print(error)
                }
                
                
                  //  let curCond = json["message"] as! [String:Any]
                  //  print(curCond)
                   /* guard let user = json as? Any else { print("else e girdi");return }
                    
                    
                        guard let userDict = json as? [String: Any] else { return }
                        guard let userId = userDict["message"] as? Int else { print("not an Int"); return }
                        guard let name = userDict["status"] as? String else { return }
                        guard let company = userDict["company"] as? [String: String] else { return }
                        guard let companyName = company["name"] else { return }
                        
                        print(userId)
                        print(name)
                        print(companyName)
                        print(" ")*/                           }
            
            }.resume()
    }

}

