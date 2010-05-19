$(function() {
    // on focus lost -> none are empty
    /**
     * Attaches a lostFocus event to the given selector and adds a warning div below if the user
     * does not fill in the 
     */
    function not_empty_on_focus_lost(selector) {
        $(selector + '').lostFocus(function() {
            $(selector + '').append('div', 'error')
        });
    }
    
    not_empty_on_focus_lost('input.name')
    not_empty_on_focus_lost('input.email')
    not_empty_on_focus_lost('input.message')
    
    
    /**
     * Check to see that the email address is valid when focus is lost.
     */
    if($('input.email').lostFocus()) {
        $('input.email').validate()
    }
});