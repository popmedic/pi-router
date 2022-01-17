<!DOCTYPE html>

<html>
    <head>
        <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
        <meta content="utf-8" http-equiv="encoding">
        <link rel="icon" href="data:;base64,iVBORw0KGgo=">

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
        </style>

        <script lang="javascript">
            function getParameterByName(name, url = window.location.href) {
                name = name.replace(/[\[\]]/g, '\\$&');
                var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }

            function loaded() {
                readRouterInterfaces(getParameterByName("routerInterface"));
                readSharedInterfaces(getParameterByName("sharedInterface"));
                readValidateJSON();
            }

            function readValidateJSON() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        var obj = JSON.parse(this.responseText);
                        document.getElementById("contentValidateJSON").value = obj.contents;
                    } else if (this.status != 0 && this.status != 200) {
                        alert(this.status + "Error" + this.responseText);
                    }
                };
                xhttp.open("GET", "/API/read_validate_json.php", true);
                xhttp.setRequestHeader("Content-type", "application/json");
                xhttp.send();
            }

            function writeValidateJSON() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        readValidateJSON();
                    } else if (this.status != 0 && this.status != 200) {
                        alert(this.status + "Error" + this.responseText);
                    }
                };
                xhttp.open("POST", "/API/write_validate_json.php", true);
                xhttp.setRequestHeader("Content-type", "application/json");
                xhttp.send(
                    JSON.stringify(
                        { 
                            "contents": document.getElementById("contentValidateJSON").value
                        }
                    )
                );
            }

            function readINETInterfaces(id, current) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        var obj = JSON.parse(this.responseText);
                        var sel = document.getElementById(id);
                        for (var i = 0; i < obj.interfaces.length; i++) {
                            var iface = new Option(obj.interfaces[i], i);
                            sel.options.add(iface);
                            if (obj.interfaces[i] == current) {
                                sel.options.selectedIndex = i;
                            }
                        }
                    } else if (this.status != 0 && this.status != 200) {
                        alert(this.status + "Error" + this.responseText);
                    }
                };
                xhttp.open("GET", "/API/read_inet_interfaces.php", true);
                xhttp.setRequestHeader("Content-type", "application/json");
                xhttp.send();
            }

            function readRouterInterfaces(current) {
                readINETInterfaces("routerInterface", current);
            }

            function readSharedInterfaces(current) {
                readINETInterfaces("sharedInterface", current);
            }
        </script>
    </head>
    <body onload="javascript:loaded()">
        <h2>
            Router Interface
        </h2>
        <p>
            <select id="routerInterface" name="routerInterface">
            </select>
        </p>
        <h2>
            Shared Interface
        </h2>
        <p>
            <select id="sharedInterface" name="sharedInterface">
            </select>
        </p>
        <h2>
            Validate JSON
        </h2>
        <p>
            <textarea rows="20" cols="80" name="contentValidateJSON" id="contentValidateJSON"></textarea>
            <p/>
            <button type="button" value="save" onclick="javascript:writeValidateJSON()">Save</button>
        </p>
    </body>
</html>