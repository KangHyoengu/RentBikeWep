function myMap(){
	const myCenter = new google.maps.LatLng(37.56575, 126.97686);
	
	let mapProp = {
			center: myCenter,
			zoom: 17,
	};
	
	let map = new google.maps.Map(document.getElementById('google-map'), mapProp);
}

function searchMap() {
	let length = Object.keys(place).length;
	if(length == 0){
		alert('검색 결과가 없습니다.');
		return;
	}
	const myCenter = new google.maps.LatLng(place[0].stationLatitude, place[0].stationLongitude);
	
	let mapProp = {
			center: myCenter,
			zoom: 17,
	};
	
	let map = new google.maps.Map(document.getElementById('google-map'), mapProp);
	
	for (let i = 0; i < length; i++) {
		let marker = new google.maps.Marker({
		  position: new google.maps.LatLng(place[i].stationLatitude, place[i].stationLongitude),
		});
		
		google.maps.event.addListener(marker,'click',function() {
		  map.setZoom(19);
		  map.setCenter(marker.getPosition());
		});
		
		let infowindow = new google.maps.InfoWindow({
		  content: "현재/전체<br>" + "  " + place[i].parkingBikeTotCnt + "/" + place[i].rackTotCnt
		});

		infowindow.open(map,marker);
		marker.setMap(map);
	}
	place = {};
}

$('#search').click(() => {
	search();
});

$('input:text[name=search]').keydown(() => {
	if(event.keyCode == 13){
		search();
	}
});

let start = 1;
let end = 1000;
let place = {};
let cnt = 0;

function search() {
	let api_key = "534d657652666b643333736d6f6c71";
	// JSON 데이터 request
	let url = "http://openapi.seoul.go.kr:8088/" + api_key + "/json/bikeList/" + start + "/" + end;

	$.ajax({
		url: url,
		dataType: "json",
		type: "GET",
		cache: false,
		success: function (data, status) {
			if (status == "success") {
				parseJSON(data);
			}
		}
	});
}

function parseJSON(jsonObj) {
	let name = $('input:text[name=search]').val().trim();
	let row = jsonObj.rentBikeStatus.row;
	
	for (let i = 0; i < row.length; i++) {
		var testReg = new RegExp(name, 'g');
		
		if (testReg.test(row[i].stationName)) {
			place[cnt] = row[i];
			cnt++;
		}
	}

	if (end < 3000) {
		start += 1000;
		end += 1000;
		search();
	} else {
		start = 1;
		end = 1000;
		cnt = 0;
		searchMap();
	}
}

