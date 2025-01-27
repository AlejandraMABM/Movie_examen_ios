//
//  MainViewController.swift
//  Movie_IOS
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [Movie] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieViewCell
               let movie = list[indexPath.row]
               cell.render(from: movie)
               return cell
    }
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        tableView.dataSource=self
        
        findMovieBy(title: "matrix")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexpath = tableView.indexPathForSelectedRow!
        let movie = list[indexpath.row]
        detailViewController.movie = movie
        print("camino a detail")
        tableView.deselectRow(at: indexpath, animated: true)
    }
    
    func findMovieBy(title: String) {
        Task {
            do {
                // Llamada a la API
                list = try await MovieProvider.findMovieBy(title: title)
                
                // Actualización en el hilo principal
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    // Iterar y hacer print de cada película en la lista
                   for _ in self.list {
                        print(self.list) // Asegúrate de que `title` existe en el modelo de datos
                    }
                }
            } catch {
                // Manejo del error
                print("Error al buscar películas: \(error)")
            }
        }
    }

}
