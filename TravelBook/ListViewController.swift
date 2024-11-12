//
//  ListViewController.swift
//  TravelBook
//
//  Created by XECE on 26.09.2024.
//

import UIKit
import CoreData

class ListViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var titleArray = [String]()
    var idArray = [UUID]()
    var chosenTitle = ""
    var chosenTitleId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        getData() // ilk açılışta veriyi getir.
        
    }
      //ekran görünür hale geldiğinde
    override func viewWillAppear(_ animated: Bool) {
        
        //newplaces adlı bildirimi dinle
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newPlace"), object: nil)
    }
    
    //core datadan veriyi çekme fonksiyonu
    @objc func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.returnsObjectsAsFaults = false
        
        
        do {
            
            
            
            let results = try context.fetch(request)
            if results.count > 0 {
                
                
                self.titleArray.removeAll(keepingCapacity: false)
                self.idArray.removeAll(keepingCapacity: false)
                
                
                for result in results as! [NSManagedObject] {
                    
                    
                    
                    
                    if let title = result.value(forKey: "title") as? String {
                        self.titleArray.append(title)
                        
                    }
                    if let id  = result.value(forKey: "id") as? UUID {
                        
                        self.idArray.append(id)
                    }
                
                    tableView.reloadData() //veriyi güncelledikten sonra tableviewi yenile
                }
            
            }
            
            
        } catch {
            print ("error")
        }
        
    }
    
    @objc func addButtonClicked () {
        
        chosenTitle = ""
    
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    
   //veri silme
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      
        
        if editingStyle == .delete {
            
            // CoreData'dan veriyi silin
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = idArray[indexPath.row].uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let result = results.first as? NSManagedObject {
                    context.delete(result)
                    try context.save()
                    // Dizilerden de veriyi silin
                    titleArray.remove(at: indexPath.row)
                    idArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            } catch {
                print("Error deleting data: \(error)")
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenTitle = titleArray[indexPath.row]
        chosenTitleId = idArray[indexPath.row]
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.selectedTitle = chosenTitle
               destinationVC.selectedTitleID = chosenTitleId
                                                              }
                                                              }
                                                              }

                                                            
                                                              
                                                              
                                                             
