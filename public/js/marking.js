( function() {

    var ma = function() {
        var ancs = document.getElementsByTagName( 'a' )
        , rets = []
        ;
        for( var i=0, m=ancs.length; i<m; i++ ){
            if( !!ancs[ i ] && /(^|\s)marking-button(\s|$)/.test( ancs[ i ].className ) ){
                rets.push( ancs[ i ] );
            }
        }
        return rets;
    }();

    var sd = 'ec2-54-250-201-57.ap-northeast-1.compute.amazonaws.com';
    for( var i=0, m=ma.length; i<m; i++ ){
        var img = document.createElement( 'img' )
        , anc = document.createElement( 'a' )
        , span = document.createElement( 'span' );

        img.setAttribute( 'src', '//' + sd + '/img/allstamp.png' )
        , img.setAttribute( 'width', '72' )
        , img.setAttribute( 'height', '18' )
        , anc.setAttribute( 'href', '//' + sd + '/decide/marking' )
        , anc.onclick = function() {
            var href_param = this.href + '?';
            href_param += 'refurl=' + encodeURIComponent( document.location );
            href_param += '&reftitle=' + encodeURIComponent( document.title );
            window.open( href_param, 'markingWindow', 'width=500, height=300, menubar=no, personalbar=no, resizable=yes' )
            return false;
        }
        , anc.appendChild( img )
        , span.appendChild( anc );

        ma[ i ].parentNode.insertBefore( span, ma[ i ] )
        , ma[ i ].parentNode.removeChild( ma[ i ] );
    }

} )();
