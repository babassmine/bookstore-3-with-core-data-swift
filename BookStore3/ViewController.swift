//
//  ViewController.swift
//  BookStore3
//
//  Created by Abass Sesay on 11/14/15.
//  Copyright © 2015 Abass Sesay. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var managedObjectContext: NSManagedObjectContext!;
    
    func loadBooks() -> Array<AnyObject> {
        var error: NSError? = nil
        var fetchRequest = NSFetchRequest(entityName: "Book")
        NSFetchRequest(entityName: "Book")
        var result = [AnyObject]()
        do {
            result = try
            managedObjectContext!.executeFetchRequest(fetchRequest)
        } catch let error as NSError {
            NSLog("My Error: %@", error)
        };
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedObjectContext = appDelegate.managedObjectContext as NSManagedObjectContext
        
    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//            return 1
//    }
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
                return 1
    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
//        
//        var book: Book = loadBooks()[indexPath.row] as! Book
//        cell.textLabel.text = book.title
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
            var book: Book = loadBooks()[indexPath.row] as! Book
            cell!.textLabel!.text = book.title
            
            return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNew(sender: AnyObject) {
        let entity = NSEntityDescription.entityForName("Book", inManagedObjectContext:managedObjectContext)
        
        var book = Book(entity: entity!,insertIntoManagedObjectContext:managedObjectContext)
        
        book.title = "My Book:" + String(loadBooks().count)
        
        var error: NSError?
//        managedObjectContext.save(&error)
//         myTableView.reloadData()
//        self.tableView.reloadData()
        
    }
}



