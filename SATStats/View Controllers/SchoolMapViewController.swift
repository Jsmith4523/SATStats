//
//  SchoolMapViewController.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/27/23.
//

import UIKit
import MapKit

class SchoolMapViewController: UIViewController {
    
    var school: School!
    
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
    }
    
    private func configureMapView() {
        mapView.delegate = self
        
        let annotation = SchoolAnnotation(school: school)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: .init(latitudeDelta: 0.010, longitudeDelta: 0.010))
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    
    deinit {
        mapView.removeAnnotations(mapView.annotations)
    }
}


extension SchoolMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? SchoolAnnotation {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            annotationView.markerTintColor = UIColor(named: "tint")!
            annotationView.glyphImage = UIImage(systemName: "graduationcap")
            annotationView.titleVisibility = .visible
                        
            return annotationView
        }
        return nil
    }
}

final class SchoolAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(school: School) {
        self.title = school.name
        self.coordinate = school.coordinate!
    }
}
