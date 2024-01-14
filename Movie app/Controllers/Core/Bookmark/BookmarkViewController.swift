//
//  BookmarkViewController.swift
//  Movie app
//
//  Created by Eva Madarasz
//

import UIKit

class BookmarkViewController: UIViewController {
    
    private var titles: [TitleItem] = [TitleItem]()
    
    private let watchedTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Watched"
        view.addSubview(watchedTable)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        fetchLocalStorageForBookmark()
        watchedTable.dataSource = self
        watchedTable.delegate = self
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Watched"), object: nil, queue: nil) { _ in
            self.fetchLocalStorageForBookmark()
        }
    }
          
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        watchedTable.frame = view.bounds
    }
    
    private func fetchLocalStorageForBookmark() {
        //
        DataPersistenceManager.shared.fetchingTitlesFromDataBase { [weak self] result  in
            switch result {
            case .success(let titles):
                self?.titles = titles
                
                DispatchQueue.main.async {
                    self?.watchedTable.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
//        struct BookmarkItem: Codable {
//            let id: Int
//            let title: String
//            let url: URL
//            var isBookmarked: Bool
//        }
//        
//    class BookmarkManager {
//            
//            var currentItem: BookmarkItem // BookmarkItem instance 
//            
//            
//@IBOutlet weak var bookmarkButton: UIButton!
//            
//             static var shared = BookmarkManager()
//            
//            
//          
//   
//            
//            private var userDefaults = UserDefaults.standard
//            private let bookmarkKey = "bookmarkedItems"
//            
//            private init() {
//                BookmarkManager.shared = BookmarkManager.shared
//                self.userDefaults = UserDefaults()
//                self.currentItem = BookmarkItem(id: 0, title: "", url: URL(fileURLWithPath: ""), isBookmarked: false)
//                
//                
//            }
//            
//            func toggleBookmark(for item: BookmarkItem) {
//                var bookmarkedItems = getBookmarkedItems()
//                if let index = bookmarkedItems.firstIndex(where: { $0.id == item.id }) {
//                    bookmarkedItems[index].isBookmarked.toggle()
//                } else {
//                    bookmarkedItems.append(item)
//                }
//                
//                saveBookmarkedItems(bookmarkedItems)
//            }
//            
//            @IBAction func bookmarkButtonTapped(_ sender: Any) {
//                BookmarkManager.shared.toggleBookmark(for: currentItem)
//                updateBookmarkButtonUI()
//            }
//            
//            func updateBookmarkButtonUI() {
//                let isBookmarked = currentItem.isBookmarked
//                let bookmarkImage = isBookmarked ? UIImage(named: "bookmark.fill") : UIImage(named: "bookmark")
//                bookmarkButton.setImage(bookmarkImage, for: .normal)
//            }
//            
//            func getBookmarkedItems() -> [BookmarkItem] {
//                if let data = userDefaults.data(forKey: bookmarkKey),
//                   let savedItems = try? JSONDecoder().decode([BookmarkItem].self, from: data) {
//                    return savedItems
//                }
//                return []
//            }
//            
//            private func saveBookmarkedItems(_ items: [BookmarkItem]) {
//                if let data = try? JSONEncoder().encode(items) {
//                    userDefaults.set(data, forKey: bookmarkKey)
//                }
//            }
//            
//        }
//        
//   
        
   
}

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return  UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.title! , posterURL: title.posterPath!))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        switch editingStyle {
        case .delete:
            
            DataPersistenceManager.shared.deleteTitleWith(model: titles[indexPath.row]) { [weak self] result in
                switch result {
                case .success():
                    print("Deleted from the database")
                case .failure(let error):
                    print(error)
                }
                self?.titles.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        
        guard let titleName = title.originalTitle else {
            return
        }
        
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                DispatchQueue.main.async {
                    let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverView: title.overview!))
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
               
            case .failure(let error):
                print(error)
            }
        }
    }

}

    
// for the HomeViewController
// Assuming you have a BookmarkItem instance called currentItem
//  ===> BookmarkManager.shared.toggleBookmark(for: currentItem) <====
// Update your UI to reflect the new bookmark status


