import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Map, Overlay, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { MapBrowserEvent } from 'ol';
import { toStringXY } from 'ol/coordinate';
import Feature, { FeatureLike } from 'ol/Feature';
import Point from 'ol/geom/Point';
import { fromLonLat, toLonLat } from 'ol/proj';
import { Style, Icon, Fill, Stroke, Text } from 'ol/style';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import { Geometry } from 'ol/geom';
import { BarService } from '@app/services/bar/bar.service';
import { Bar } from '@app/models/bar';
import { ObjectEvent } from 'ol/Object';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.css'],
})
export class MapComponent {
  map!: Map;
  vectorSource!: VectorSource<Feature<Geometry>>;
  vectorLayer!: VectorLayer<VectorSource<Feature<Geometry>>>;
  list: Bar[] = [];
  popup!: Overlay;

  constructor(private bar: BarService) {}

  ngOnInit() {
    this.getUserLocation();
    this.bar.getList().subscribe((data: any) => {
      this.list = data;
      this.initializeMap();
    });
  }

  initializeMap() {
    this.vectorSource = new VectorSource();

    this.list.forEach((bar) => {
      const marker = new Feature({
        geometry: new Point(
          fromLonLat([bar.longitud ?? 0, bar.latitud ?? 0], 'EPSG:4326')
        ),
        id_bar: bar.id_bar,
        nombre_bar: bar.nombre_bar,
      });

      marker.setStyle(
        new Style({
          image: new Icon({
            anchor: [0.5, 1],
            src: 'assets/icon/market.png',
          }),
        })
      );

      this.vectorSource.addFeature(marker);
    });

    this.vectorLayer = new VectorLayer({
      source: this.vectorSource,
    });

    this.map = new Map({
      target: 'map',
      layers: [
        new TileLayer({
          source: new OSM(),
        }),
        this.vectorLayer,
      ],
      view: new View({
        center: [-8861349.65, -239383.2],
        zoom: 17,
      }),
    });

    // Inicializar el popup
    this.popup = new Overlay({
      element: document.getElementById('popup')!,
      autoPan: true,
    });

    this.map.addOverlay(this.popup);

    // Registrar el evento 'singleclick' en el mapa
    this.map.on('singleclick', (event: MapBrowserEvent<UIEvent>) => {
      const feature = this.map.forEachFeatureAtPixel(
        event.pixel,
        (feature: FeatureLike) => feature
      );
  
      if (!feature) {
        // Si no se hizo clic en una característica, cierra el popup
        this.popup.setPosition(undefined);
      } else {
        const coordinates = event.coordinate;
        const content = `<h3>${feature.get('nombre_bar')}</h3>`;
        this.showPopup(coordinates, content);
      }
    }); 
  }

  handleMapClick(event: any) {
    const feature = this.map.forEachFeatureAtPixel(
      event.pixel,
      (feature: FeatureLike) => feature
    );

    if (feature) {
      const coordinates = event.coordinate;
      const content = `<h3>${feature.get('nombre_bar')}</h3>`;
      this.showPopup(coordinates, content);
    }
  }

  getUserLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const coordinates = [position.coords.longitude, position.coords.latitude];

        console.log(coordinates)
        // Ahora puedes agregar un marcador para la ubicación del usuario
        const userMarker = new Feature({
          geometry: new Point(fromLonLat(coordinates)),
          nombre_bar: 'Tu Ubicación',
        });

        userMarker.setStyle(
          new Style({
            image: new Icon({
              anchor: [0.5, 1],
              src: 'assets/icon/location.png',
            }),
          })
        );

        this.vectorSource.addFeature(userMarker);
      });
    }
  }

  showPopup(coordinate: number[], content: string) {
    const popupContent = document.getElementById('popup-content')!;
    popupContent.innerHTML = content;
    this.popup.setPosition(coordinate);
  }
}
