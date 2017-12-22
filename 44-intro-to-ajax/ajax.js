document.addEventListener( 'DOMContentLoaded', function() {
    // Get elements.
    var button = document.getElementById( 'get_monsters' );
    var postButton = document.getElementById( 'post_monster' );

    // Register event handler for 'get_monsters'.
    button.addEventListener( 'click', function() {
        console.log( 'BEFORE AJAX' );

        var monstersResponse = $.ajax( {
            url: 'http://monsters-api.herokuapp.com/monsters',
            method: 'GET',
            dataType: 'html',
        } );

        // Add handler for case where the request succeeds.
        monstersResponse.done( function( responseData ) {
            console.log( 'REQUEST SUCCEEDED' );

            var newElem = document.createElement( 'div' );
            newElem.innerHTML = responseData;
            document.body.appendChild( newElem );
        } );

        // Add handler for case where the request fails.
        monstersResponse.fail( function() {
            console.log( 'REQUEST FAILED' );
        } );

        console.log( 'AFTER AJAX' );
    } );

    // Register event handler for 'post_monster'.
    postButton.addEventListener( 'click', function() {
        $.ajax( {
            url: 'http://monsters-api.herokuapp.com/monsters',
            method: 'POST',
            data: {
                monster: {
                    name: 'Son of Baked Goods Goblin',
                    home: 'Whitby, ON',
                    creepiness: 666,
                }
            },
        } ).done( function( response ) {
            console.log( 'REQUEST SUCCEEDED --> CREATED MONSTER' );
        } ).fail( function() {
            console.log( 'REQUEST FAILED --> FAILED TO CREATE MONSTER' );
        } );
    } );
} );
