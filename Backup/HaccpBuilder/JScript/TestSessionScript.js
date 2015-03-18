<script language="javascript" type="text/javascript">


    setTimeout(DisplayExtendSessionLifeBox, 1000*6*2);
    setTimeout(CloseExtendSessionLifeBox, 1000 * 6 * 3);
    function SessionAlert() {
        alert("Your Session will time out in 5 minutes");
    }

    function CloseExtendSessionLifeBox() {
        var boxElement = document.getElementById("dvOverlay");
        //var boxElement = document.getElementById("<%# ExtendSessionLifeBox.ClientID %>");
        //checking if the element exists before trying to use it
       
        if (boxElement) {
            boxElement.style.display = "none";
            boxElement.style.visibility = "hidden";
        }
    }


    function BrowserWidth() {
        var theWidth;
        if (window.innerWidth) {
            theWidth = window.innerWidth;
        }
        else if (document.documentElement && document.documentElement.clientWidth) {
            theWidth = document.documentElement.clientWidth;
        }
        else if (document.body) {
            theWidth = document.body.clientWidth;
        }
        return theWidth;
    }
    function BrowserHeight() {
        var theHeight;
        if (window.innerHeight) {
            theHeight = window.innerHeight;
        }
        else if (document.documentElement && document.documentElement.clientHeight) {
            theHeight = document.documentElement.clientHeight;
        }
        else if (document.body) {
            theHeight = document.body.clientHeight;
        }
        return theHeight;
    }

    function DisplayExtendSessionLifeBox() {
        
        //        var boxElement = document.getElementById("ctl00_ExtendSessionLifeBox");
        var boxElement = document.getElementById("dvOverlay");
        //var boxElement = document.getElementById("<%# ExtendSessionLifeBox.ClientID %>");
       
        if (boxElement) {

            //boxElement.style.display = "block";
//            var bw = BrowserWidth();
//            var bh = BrowserHeight();
//            var boxElementWidth = (boxElement.clientWidth) ? boxElement.clientWidth : boxElement.offsetWidth;
//            var boxElementHeight = (boxElement.clientHeight) ? boxElement.clientHeight : boxElement.offsetHeight;

//            var boxElementTop = (bh / 2) - (boxElementHeight / 2);
//            var boxElementLeft = (bw / 2) - (boxElementWidth / 2);
//            boxElement.style.top = boxElementTop;
//            boxElement.style.left = boxElementLeft;
//            boxElement.focus();
            //            boxElement.style.position = "absolute";
            //////////////////////////
            // TO SHOW MODAL POPUP EXTENDER AJAX
            //$find('ctl00_mpeSession').show();
            ///////////////////////////
            //el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible"
            boxElement.style.visibility = "visible";
            boxElement.focus();
            //document.all('txtInput2').focus();

        }
    }


    </script>