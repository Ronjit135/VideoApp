function onLoad() {
	document.getElementById("moviePath").value = "";
	document.getElementById("showPath").value = "";
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
	if (url == 'AddMoviePath') {
		addMovieData(data);
	} else if (url = 'AddShowPath') {
		addShowData(data);
	} else {
		console.log(data);
	}
}

function savePath(element) {
	if (element.id == "movie") {
		var moviePath = document.getElementById("moviePath").value;
		if (moviePath == "") {
			alert("Enter Movie Path");
		} else {
			if ((moviePath.charAt(0) != "\\" && moviePath.charAt(1) != "\\")
					&& (moviePath.charAt(0) != "/" && moviePath.charAt(1) != "/")) {
				if (!moviePath.charAt(0).match(/^[a-zA-z]/)) {
					alert("Enter Valid location");
					return false;
				}
				if (moviePath.charAt(1) == ""
						|| !moviePath.charAt(1).match(/^[:]/)
						|| !moviePath.charAt(2).match(/^[\/\\]/)) {
					alert("Enter Valid location");
					return false;
				} else {
					alert("Entered location " + moviePath + " is correct");
					sendRequest("AddMoviePath", "moviePath=" + moviePath);
				}
			}
		}
	}
	if (element.id == "show") {
		var showPath = document.getElementById("showPath").value;
		if (showPath == "") {
			alert("Enter Show Path");
		} else {
			if ((showPath.charAt(0) != "\\" && showPath.charAt(1) != "\\")
					&& (showPath.charAt(0) != "/" && showPath.charAt(1) != "/")) {
				if (!showPath.charAt(0).match(/^[a-zA-z]/)) {
					alert("Enter Valid location");
					return false;
				}
				if (showPath.charAt(1) == ""
						|| !showPath.charAt(1).match(/^[:]/)
						|| !showPath.charAt(2).match(/^[\/\\]/)) {
					alert("Enter Valid location");
					return false;
				} else {
					alert("Entered location " + showPath + " is correct");
					sendRequest("AddShowPath", "showPath=" + showPath);
				}
			}
		}
	}
}

function addMovieData(data) {
	var currentMoviePath = data.responseText;
	document.getElementById("currentMoviePath").innerHTML = currentMoviePath;

}

function addShowData(data) {
	var currentShowPath = data.responseText;
	document.getElementById("currentShowPath").innerHTML = currentShowPath;
}