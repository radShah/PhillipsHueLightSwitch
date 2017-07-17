//
//  HueTableViewController.swift
//  PhillipsHueLightSwitch
//
//  Created by Radha on 4/22/17.
//  Copyright © 2017 RadShah. All rights reserved.
//

import UIKit

class HueTableViewController: UITableViewController {
    
    /* Use Charles Proxy */
    
    private static let API_URL = "http://10.3.125.234/api/"
    private static let API_KEY = "8o0jWEVv0ZiWrXse3CxI4-3V1c0JINZMu2XF4nFE"
    private static let LIGHTS_END_POINT = "/lights/"
    
    private enum Method : String {
        case get = "GET"
        case put = "PUT"
    }
    
    private var lights : [Light]? {
        didSet {
            print(lights?.count ?? 0)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getLights()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    func getLights() {
        guard let url = URL(string: HueTableViewController.API_URL
            + HueTableViewController.API_KEY
            + HueTableViewController.LIGHTS_END_POINT)
            else {
                return
        }
        
        let session : URLSession = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = Method.get.rawValue
        
        var dataTask: URLSessionDataTask?
        
        dataTask = session.dataTask(with: url) {
            data, response, error in
            // 6
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }

            // 7
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                }
            }
        }
        // 8
        dataTask?.resume()
    }
}
        // [weak self]
        /*let task = session.dataTask(with: request) {  (data, response, error) in
            // guard let strongSelf = self else { return }
            guard let data = data, let error = nil, let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                print("error was \(error)")
                return
            }
            
            if let lightsJSON = responseJSON?["lights"] as? [String: Any] {
                
                strongSelf.lights = lightsJSON.flatMap {
                    
                    guard let lightInfo = $0.value as? [String: Any],
                        let state = lightInfo["state"] as? [String: Any],
                        let isOn = state["on"] as? Bool,
                        let brightness = state["bri"] as? Int,
                        let hue = state["hue"] as? Int,
                        let saturation = state["sat"] as? Int else { return nil }
                    
                    return Light(lightName: $0.key, isOn: isOn, saturation: saturation, brightness: brightness, hue: hue)
                }
            }
            
        }
        
        task.resume()*/
    //}
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return lights?.count
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as UITableViewCell
        
        //cell.textLabel?.text = lights?[indexPath.row].lightName
        
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


