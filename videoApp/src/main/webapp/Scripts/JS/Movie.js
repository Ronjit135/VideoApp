function onLoad() {
	document.getElementById("movie").hidden = false;
	document.getElementById("loading").hidden = true;
}

function sendRequest(url, content) {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			response(this, url);
		}
	};
	xmlhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xmlhttp.send(content);
}

function response(data, url) {
	if (url == 'SelectDirectory') {
		selectDirectoryData(data);
	} else {
		console.log(data);
	}
}

function selectDirectory(element) {
	sendRequest("SelectDirectory", "directory=" + element.childNodes[0].data);
}

function selectDirectoryData(data) {
	var files = JSON.parse(data.response);
	var tBody = document.getElementById("added");
	clearData(tBody);
	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		var p = document.createElement("p");
		p.setAttribute("onclick", "show(this)");
		var text = document.createTextNode(file);
		p.appendChild(text);
		td.appendChild(p);
		tr.appendChild(td);
		tBody.appendChild(tr);
	}
}

function clearData(element) {
	for (var i = 0; i < element.childNodes.length; i++) {
		var element = element.childNodes[i];
		element.remove();
	}
}

function show(ele) {
	var req = new XMLHttpRequest();
	req.open('GET', "Movie/Preview?movieName=" + ele.innerHTML, true);
	req.responseType = 'blob';
	req.onload = function() {
		if (this.status === 200) {
			var videoBlob = this.response;
			var vid = URL.createObjectURL(videoBlob); // IE10+
			showVideo(vid);
		}
	}
	req.onerror = function() {
		console.log("Error");
	}
	req.send();
	document.getElementById("movie").hidden = true;
	document.getElementById("loading").hidden = false;
}

function showVideo(src) {
	onLoad();
	var params = "fullscreen=yes,left=0,top=0,menubar=no,scrollbars=yes,status=no,titlebar=no,toolbar=no,width="
			+ screen.width + ",height=" + screen.height;
	console.log(params);
	var data = "<!DOCTYPE html><html><body bgcolor='black'><div style='width:100%;height=100%;'><video style='display: block;margin: auto;position: absolute;top: 50%;right: 50%;transform: translate(50%, -50%);' controls><source src='"
			+ src + "' type='video/mp4'></source></video></div></body></html>";
	var myWindow = window.open("", "Preview", params);
	myWindow.document.write(data);
	mywindow.moveTo(0, 0);
}

function test() {
	var videoDiv = document.getElementById("videoDiv");
	var video = document.createElement("video");
	video.setAttribute("id", "video");
	video.setAttribute("width", "320");
	video.setAttribute("height", "240");
	video.setAttribute("controls", "true");
	video.setAttribute("preload", "auto");
	var source = document.createElement("source");
	source.setAttribute("id", "play");
	source.setAttribute("src", src);
	source.setAttribute("type", "video/mp4");
	video.appendChild(source);
	videoDiv.appendChild(video);
}