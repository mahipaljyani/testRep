import { LightningElement, api } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import leaflet from '@salesforce/resourceUrl/leaflet';
import {loadStyle, loadScript} from 'lightning/platformResourceLoader';

export default class InteractiveMap extends LightningElement {
    @api markers;
    @api center;
    @api zoom;
    @api icon;
    
    updateCordinates(lat, lng) {
        loadScript(this, leaflet + '/leaflet.js'),
        loadStyle(this, leaflet + '/leaflet.css')
        const bearFields = {};
        bearFields['Id'] = this.recordId;
        bearFields['mahijat__Location__Latitude__s'] = lat;
        bearFields['mahijat__Location__Longitude__s'] = long;

        const recordInput = { fields: bearFields };
        let options;
        if (this.icon) {
            //custom marker
            let customMarker = L.icon({
                iconUrl: this.icon,
                iconSize: [40, 45], // size of the icon
                shadowSize: [50, 64], // size of the shadow
                shadowAnchor: [4, 62],  // the same for the shadow
            });

            options = { icon: customMarker };
        }

        let markerLayers = [];
        this.markers.forEach(marker => {
            markerLayers.push(L.marker([bearFields['mahijat__Location__Latitude__s'], bearFields['mahijat__Location__Longitude__s']], options).bindPopup(marker.content));
        });
        var areas = L.layerGroup(markerLayers);

        var baseLayer = L.tileLayer(
            'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; ' + ' Contributors',
            maxZoom: 18,
        });

        const mapRoot = this.template.querySelector(".map-root");
        var map = L.map(mapRoot, {
            center: [this.center.latitude, this.center.longitude],
            zoom: this.zoom || 16,
            layers: [baseLayer, areas]
        });
    }
}