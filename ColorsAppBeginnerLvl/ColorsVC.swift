//
//  ColorsVC.swift
//  ColorsAppBeginnerLvl
//
//  Created by Consultant on 12/19/22.
//

import UIKit

// adding in + Conforming to Delegate
class ColorsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //creating empty array to accept UI colors as they type/value and make the colors random -- Tableviews need an array to work properly and have a delection base
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        // Do any additional setup/task after loading the view.
    }
    // We need a Function that will generate 50 random colors- For Loop that iterates 50x, creating a different random color each time -- then Append that color to our colors array above ^ ^ ^
    func addRandomColors() {
        for _ in 0..<50 {
            // everytime this iterates, the createRandomColor function is called, and this initiates that process
            colors.append(createRandomColor())
        }
    }
    // function to Create return random Color
    func createRandomColor() -> UIColor {
        let randomColor = UIColor(  red: CGFloat.random(in: 0...1),
                                    green:  CGFloat.random(in: 0...1),
                                    blue: CGFloat.random(in: 0...1),
                                    alpha: 1             )
        return randomColor
    }
    
    
    //this code handles our segue function/task.. This is where we designate our destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // CASTING --- hey you are of this type, and can access the variable in the Colors Detail VC file ---whereever our VC points, thats where we get our info from/send to gives us access to what special cases the Color Detail page may have - in this case just the color to display on background
        let destVC = segue.destination as! ColorsDetailVC
        
        // we are setting the color here on the sender past in,, this sender is the color we Tapped! 
        destVC.color = sender as? UIColor
    }
    // stubs code given to use after we added in UITableViewDelegate, UITableViewDataSource  --- to our class - ColorsVC-re
    // this show how many rows we want, if I wanted a hard set number I could do return 30 and we would have exactly 30 rows, but we made this dynamic, in our for loop, we specified 50 rows with ' for _ in 0..<50 '
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellColor")
        let kolor = colors[indexPath.row]
        cell?.backgroundColor = kolor
        return cell!
    }
    // didSelectRowAt indexPath says: When something is selected do this
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // whatever row we tap, it  will get this color for the background
        let color = colors[indexPath.row]
        
        //this tells our segue what to do, how to operate, what section it is going to and what to display -- the sender is from the other file and that is how the 2 screens know what to do and how to operate
        performSegue(withIdentifier: "ToMyColorsVC", sender: color)
    }}
    
    
    
   


