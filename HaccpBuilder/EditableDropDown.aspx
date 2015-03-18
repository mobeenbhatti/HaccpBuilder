<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditableDropDown.aspx.cs" Inherits="HaccpBuilder.EditableDropDown" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="JScript/jquery-1.9.0.js" type="text/javascript"></script>
<script src="JScript/jquery-ui-1.10.0.custom.js" type="text/javascript"></script>
<script src="JScript/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
 <style>
.ui-combobox {
position: relative;
display: inline-block;
}
.ui-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
/* support: IE7 */
*height: 1.7em;
*top: 0.1em;
}
.ui-combobox-input {
margin: 0;
padding: 0.3em;
}
</style>
<script type="text/javascript">
    (function ($) {
        $.widget("ui.combobox", {
            _create: function () {
                var input,
that = this,
wasOpen = false,
select = this.element.hide(),
selected = select.children(":selected"),
value = selected.val() ? selected.text() : "",
wrapper = this.wrapper = $("<span>")
.addClass("ui-combobox")
.insertAfter(select);
                function removeIfInvalid(element) {
                    var value = $(element).val(),
matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(value) + "$", "i"),
valid = false;
                    select.children("option").each(function () {
                        if ($(this).text().match(matcher)) {
                            this.selected = valid = true;
                            return false;
                        }
                    });
                    if (!valid) {
                        // remove invalid value, as it didn't match anything
                        $(element)
.val("")
.attr("title", value + " didn't match any item")
.tooltip("open");
                        select.val("");
                        setTimeout(function () {
                            input.tooltip("close").attr("title", "");
                        }, 2500);
                        input.data("ui-autocomplete").term = "";
                    }
                }
                input = $("<input>")
.appendTo(wrapper)
.val(value)
.attr("title", "")
.addClass("ui-state-default ui-combobox-input")
.autocomplete({
    delay: 0,
    minLength: 0,
    source: function (request, response) {
        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
        response(select.children("option").map(function () {
            var text = $(this).text();
            if (this.value && (!request.term || matcher.test(text)))
                return {
                    label: text.replace(
new RegExp(
"(?![^&;]+;)(?!<[^<>]*)(" +
$.ui.autocomplete.escapeRegex(request.term) +
")(?![^<>]*>)(?![^&;]+;)", "gi"
), "<strong>$1</strong>"),
                    value: text,
                    option: this
                };
        }));
    },
    select: function (event, ui) {
        ui.item.option.selected = true;
        that._trigger("selected", event, {
            item: ui.item.option
        });
    },
    change: function (event, ui) {
        if (!ui.item) {
            removeIfInvalid(this);
        }
    }
})
.addClass("ui-widget ui-widget-content ui-corner-left");
                input.data("ui-autocomplete")._renderItem = function (ul, item) {
                    return $("<li>")
.append("<a>" + item.label + "</a>")
.appendTo(ul);
                };
                $("<a>")
.attr("tabIndex", -1)
.attr("title", "Show All Items")
.tooltip()
.appendTo(wrapper)
.button({
    icons: {
        primary: "ui-icon-triangle-1-s"
    },
    text: false
})
.removeClass("ui-corner-all")
.addClass("ui-corner-right ui-combobox-toggle")
.mousedown(function () {
    wasOpen = input.autocomplete("widget").is(":visible");
})
.click(function () {
    input.focus();
    // close if already visible
    if (wasOpen) {
        return;
    }
    // pass empty string as value to search for, displaying all results
    input.autocomplete("search", "");
});
                input.tooltip({
                    tooltipClass: "ui-state-highlight"
                });
            },
            _destroy: function () {
                this.wrapper.remove();
                this.element.show();
            }
        });
    })(jQuery);
    $(function () {
        $("#combobox").combobox();
        $("#toggle").click(function () {
            $("#combobox").toggle();
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <style>
.ui-combobox {
position: relative;
display: inline-block;
}
.ui-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
/* support: IE7 */
*height: 1.7em;
*top: 0.1em;
}
.ui-combobox-input {
margin: 0;
padding: 0.3em;
}
</style>
<script>
    (function ($) {
        $.widget("ui.combobox", {
            _create: function () {
                var input,
that = this,
wasOpen = false,
select = this.element.hide(),
selected = select.children(":selected"),
value = selected.val() ? selected.text() : "",
wrapper = this.wrapper = $("<span>")
.addClass("ui-combobox")
.insertAfter(select);
                function removeIfInvalid(element) {
                    var value = $(element).val(),
matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(value) + "$", "i"),
valid = false;
                    select.children("option").each(function () {
                        if ($(this).text().match(matcher)) {
                            this.selected = valid = true;
                            return false;
                        }
                    });
                    if (!valid) {
                        // remove invalid value, as it didn't match anything
                        $(element)
.val("")
.attr("title", value + " didn't match any item")
.tooltip("open");
                        select.val("");
                        setTimeout(function () {
                            input.tooltip("close").attr("title", "");
                        }, 2500);
                        input.data("ui-autocomplete").term = "";
                    }
                }
                input = $("<input>")
.appendTo(wrapper)
.val(value)
.attr("title", "")
.addClass("ui-state-default ui-combobox-input")
.autocomplete({
    delay: 0,
    minLength: 0,
    source: function (request, response) {
        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
        response(select.children("option").map(function () {
            var text = $(this).text();
            if (this.value && (!request.term || matcher.test(text)))
                return {
                    label: text.replace(
new RegExp(
"(?![^&;]+;)(?!<[^<>]*)(" +
$.ui.autocomplete.escapeRegex(request.term) +
")(?![^<>]*>)(?![^&;]+;)", "gi"
), "<strong>$1</strong>"),
                    value: text,
                    option: this
                };
        }));
    },
    select: function (event, ui) {
        ui.item.option.selected = true;
        that._trigger("selected", event, {
            item: ui.item.option
        });
    },
    change: function (event, ui) {
        if (!ui.item) {
            removeIfInvalid(this);
        }
    }
})
.addClass("ui-widget ui-widget-content ui-corner-left");
                input.data("ui-autocomplete")._renderItem = function (ul, item) {
                    return $("<li>")
.append("<a>" + item.label + "</a>")
.appendTo(ul);
                };
                $("<a>")
.attr("tabIndex", -1)
.attr("title", "Show All Items")
.tooltip()
.appendTo(wrapper)
.button({
    icons: {
        primary: "ui-icon-triangle-1-s"
    },
    text: false
})
.removeClass("ui-corner-all")
.addClass("ui-corner-right ui-combobox-toggle")
.mousedown(function () {
    wasOpen = input.autocomplete("widget").is(":visible");
})
.click(function () {
    input.focus();
    // close if already visible
    if (wasOpen) {
        return;
    }
    // pass empty string as value to search for, displaying all results
    input.autocomplete("search", "");
});
                input.tooltip({
                    tooltipClass: "ui-state-highlight"
                });
            },
            _destroy: function () {
                this.wrapper.remove();
                this.element.show();
            }
        });
    })(jQuery);
    $(function () {
        $("#combobox").combobox();
        $("#toggle").click(function () {
            $("#combobox").toggle();
        });
    });
</script>
<div class="ui-widget">
<label>Your preferred programming language: </label>
<select id="combobox">
<option value="">Select one...</option>
<option value="ActionScript">ActionScript</option>
<option value="AppleScript">AppleScript</option>
<option value="Asp">Asp</option>
<option value="BASIC">BASIC</option>
<option value="C">C</option>
<option value="C++">C++</option>
<option value="Clojure">Clojure</option>
<option value="COBOL">COBOL</option>
<option value="ColdFusion">ColdFusion</option>
<option value="Erlang">Erlang</option>
<option value="Fortran">Fortran</option>
<option value="Groovy">Groovy</option>
<option value="Haskell">Haskell</option>
<option value="Java">Java</option>
<option value="JavaScript">JavaScript</option>
<option value="Lisp">Lisp</option>
<option value="Perl">Perl</option>
<option value="PHP">PHP</option>
<option value="Python">Python</option>
<option value="Ruby">Ruby</option>
<option value="Scala">Scala</option>
<option value="Scheme">Scheme</option>
</select>
</div>
    </form>
</body>
</html>
