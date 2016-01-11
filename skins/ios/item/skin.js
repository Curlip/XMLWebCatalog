var _name;
var desc;
var model;
var loc;
var quant;
var web;
var price;
var ref;

function blankCanvas(){
        _name = $("#info tr").attr("name");
        ref   = $("#info tr").attr("ref");
        desc  = $(".item.desc").text();
        model  = $(".item.model").text();
        loc   = $(".item.loc").text();
        quant = $(".item.quant").text();
        web   = $(".item.web").text();
        price   = $(".item.price").text();

        $("body").empty();
}

function layout(){
        $("body").append( "<table id='layout'>" +
                              "<tr>" +
                                  "<th class='filler title'></th>" +
                                  "<th class='content title' />" +
                              "</tr>" +
                              "<tr>" +
                                  "<td class='filler info'></td>" +
                                  "<td class='content info'></td>" +
                              "</tr>" +
                          "</table>" );
}

function addStatic() {
        $(".filler.title").append( "<table class='snap'><tr>" +
                                       "<td style='text-align: left;'><a id='back' href='../index.html'>Back</a></td>" +
                                       "<td class='header' style='text-align: center;'><p>All</p></td>" +
                                       "<td style='text-align: right;'></td>" +
                                   "</tr></table>" );

        $(".filler.info").append("<div id='nav'></div>")
}

function addDynamic(){
        $(".content.info").append(
                                    "<h6>" + _name + "</h6>"
            );

        $(".content.info").append( 
                                   ( model != "N/A" || desc != "N/A" ?
                                   "<div class='section'>" +

                                        ( model != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Model</h4>" +
                                            "<p>" + model + "</p>" +
                                        "</div>" : "" ) +

                                        ( desc != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Description</h4>" +
                                            "<p>" + desc + "</p>" +
                                        "</div>" : "" ) +

                                   "</div>" : "" ) );

        $(".content.info").append(
                                   ( loc != "N/A" || quant != "N/A" ?
                                   "<div class='section'>" +

                                        ( loc != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Location</h4>" +
                                            "<p>" + loc + "</p>" +
                                        "</div>" : "" ) +
                                        
                                        ( quant != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Quantity</h4>" +
                                            "<p>" + quant + "</p>" +
                                        "</div>" : "" ) +

                                   "</div>" : "" ) );

        $(".content.info").append(
                                   ( web != "N/A" || price != "N/A" ?
                                   "<div class='section'>" +

                                        ( web != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Website</h4>" +
                                            "<p>" + web + "</p>" +
                                        "</div>" : "" ) +
                                        
                                        ( price != "N/A" ?
                                        "<div class='item'>" +
                                            "<h4>Price</h4>" +
                                            "<p>" + price + "</p>" +
                                        "</div>" : "" ) +

                                   "</div>" : "" ) );

        $(".content.info").append( "<div class='section'>" +

                                        "<div class='item'>" +
                                            "<h4>ID</h4>" +
                                            "<p>" + ref + "</p>" +
                                        "</div>" +

                                   "</div>");

}

function addDynamicFiller(){

    $.ajax({
        type: "GET",
        url: "../catalog.xml",
        dataType: "xml",
        success: function(xml){
            $xmlDoc = $(xml);

            $xmlDoc.find("item").each(function(){
                aref = $(this).attr("ref");

                var href = document.location.href;
                var filename = href.substr(href.lastIndexOf('/') + 1);

                $('#nav').append("<a href='" + aref + ".html" + "'" + ((aref + ".html") == filename ? "class='current'" : "") + ">" + $(this).children("name").text() + "</a>");
            });
        },
        error: function() {
            alert("Error retrieving catalog.xml: Redirecting...");

            window.location = "../index.html";
            return false; 
        }
    });
}

$( document ).ready(function(){
        blankCanvas();
        layout();
        addStatic();
        addDynamic();
        addDynamicFiller();
});

$(window).resize(function() {

    $('body').css('height', window.innerHeight);
    $('html').css('height', window.innerHeight);

});
