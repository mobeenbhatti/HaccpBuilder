
   window.setTimeout(DisplayExtendSessionLifeBox(), 1000 * 30 );
    //window.setTimeout(CloseExtendSessionLifeBox, 1000 * 6 * 3); 
    var sessionTimeout = <%= Session.Timeout %>;
        
        function DisplaySessionTimeout()
        {
//            document.getElementById("<%= lblSessionTime.ClientID %>").innerText = sessionTimeout;
//            sessionTimeout = sessionTimeout - 1;
//            
//            if (sessionTimeout >= 0)
//                window.setTimeout("DisplaySessionTimeout()", 60000);
//            else
//            {
//                alert("Your current Session is over.");
//            }
alert('Hello');
DisplayExtendSessionLifeBox();

        }
    
    function CloseExtendSessionLifeBox() {
        var boxElement = document.getElementById("dvOverlay");
        //var boxElement = document.getElementById("<%# ExtendSessionLifeBox.ClientID %>");
        //checking if the element exists before trying to use it
        var label = document.getElementById("ctl00_lblSessionMessage");
        var button1 = document.getElementById("<%# cmdSessionConfirm.ClientID %>");
        alert(button1);
        if (label) {
            //            boxElement.style.display = "none";
            //            boxElement.style.visibility = "hidden";
            alert(label.innerText);
            label.innerText = "You have now been timed out due to inactivity. Any data on the page you were working on in the website that had not been saved by clicking continue/save has been lost. Please log back in and continue. The HACCP Builder site times out after 60 minutes of inactivity. You are provided with a 10 minute notification prior to actually being timed out.";
           
        }
    }
    function DisplayExtendSessionLifeBox() {

        //        var boxElement = document.getElementById("ctl00_ExtendSessionLifeBox");
        var boxElement = document.getElementById("dvOverlay");
        //var boxElement = document.getElementById("<%# ExtendSessionLifeBox.ClientID %>");
        sessionTimeout = sessionTimeout - 1;
         alert(sessionTimeout);              
        if(sessionTimeout == 3){              
            if (boxElement) {
                boxElement.style.visibility = "visible";
                boxElement.focus();            
            }
        }
        if(sessionTimeout == 0){        
            CloseExtendSessionLifeBox();
        }
        window.setTimeout("DisplaySessionTimeout()", 60000); 
    }
