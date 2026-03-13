
import SwiftUI
import MapKit

struct ServiceDetailView: View {

    let service: Service

    var body: some View {

        ScrollView {

            Map {
                Marker(
                    service.title,
                    coordinate: CLLocationCoordinate2D(
                        latitude: service.latitude,
                        longitude: service.longitude
                    )
                )
            }
            .frame(height:220)
            .cornerRadius(12)
            .padding()

            VStack(alignment:.leading,spacing:16){

                Text(service.title)
                    .font(.title2)
                    .bold()

                infoRow(title:"Customer",value:service.customerName)

                infoRow(title:"Description",value:service.description)

                infoRow(title:"Scheduled Time",value:service.date.smartFormat())

                infoRow(title:"Location",value:"Maple Avenue, Seattle")

                infoRow(title:"Service Notes",value:service.notes)
            }
            .padding()
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

    func infoRow(title:String,value:String) -> some View {
        VStack(alignment:.leading,spacing:4){
            Text(title)
                .font(.headline)
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}
