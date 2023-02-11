import Foundation
import UIKit

class NewServiceViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = NewServiceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @IBAction func onCancelDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension NewServiceViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfServices
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceItem", for: indexPath) as! ServiceCollectionViewCell
        let service = viewModel.currentService(indexPath.row)
        cell.title.text = service.name
        cell.imageView.image = UIImage(systemName: service.icon)
        cell.imageView.tintColor = .blue
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = viewModel.selectedServiceName()
        (segue.destination as! SelectServiceDateViewController).serviceName = name
    }
}

extension NewServiceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let service = viewModel.currentService(indexPath.row)
        viewModel.selectService(service: service)
        performSegue(withIdentifier: "dataServico", sender: nil)
    }
}
